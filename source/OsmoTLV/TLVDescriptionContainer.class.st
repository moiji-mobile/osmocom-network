"
Attempt to have a DSL for messages
"
Class {
	#name : #TLVDescriptionContainer,
	#superclass : #Object,
	#instVars : [
		'type',
		'fields'
	],
	#category : #OsmoTLV
}

{ #category : #parsing }
TLVDescriptionContainer class >> decodeByteStream: aStream type: aType [
	| description |
	description := self findTLVDescription: aType.
	"This is a generic decoding method that works by finding the
	 message structure and then following the structure and will
	 return an OrderedCollection with tuples."
	^description decodeByteStream: aStream

]

{ #category : #encoding }
TLVDescriptionContainer class >> encodeCollection: aCollection type: aType [
	| description |
	description := self findTLVDescription: aType.
	"This is a generic encoding method that will put the collection
	 onto a MessageBuffer class."
	^description encodeCollection: aCollection

]

{ #category : #creation }
TLVDescriptionContainer class >> findTLVDescription: aType [
	self allSubclassesDo: 
		[:each | 
		| struct |
		struct := each tlvDescription.
		struct type = aType ifTrue: [^struct]].
	^self error: ('Can not find TLV Description for type: <1p>' 
		    expandMacrosWith: aType)

]

{ #category : #creation }
TLVDescriptionContainer class >> initWith: aType [
	^(self new)
	    instVarNamed: #type put: aType;
	    yourself

]

{ #category : #fields }
TLVDescriptionContainer >> addFixed: aType [
	self fields add: 
		{#fixed.
		aType}

]

{ #category : #fields }
TLVDescriptionContainer >> addOptional: aType [
	self fields add: 
		{#optional.
		aType}

]

{ #category : #fields }
TLVDescriptionContainer >> addOptionals: aType [
	"Optional Parameters that may appear more than once."
	self fields add: 
		{#optionals.
		aType}

]

{ #category : #fields }
TLVDescriptionContainer >> addVariable: aType [
	self fields add: 
		{#variable.
		aType}

]

{ #category : #encoding }
TLVDescriptionContainer >> createState [
	"Subclasses can create their own state to allow jumping in the
	 stream or leave markers"
	^nil

]

{ #category : #decoding }
TLVDescriptionContainer >> decodeByteStream: aStream [
	| decoded first_optional |
	decoded := OrderedCollection new.
	first_optional := true.
	self fieldsDo: 
		[:field_type :clazz | 
		field_type = #fixed 
		    ifTrue: 
			[self 
			    parseFixed: aStream
			    with: clazz
			    into: decoded].
		field_type = #variable 
		    ifTrue: 
			[self 
			    parseVariable: aStream
			    with: clazz
			    into: decoded].
		field_type = #optional 
		    ifTrue: 
			[first_optional 
			    ifTrue: 
				[first_optional := false.
				self prepareOptional: aStream].
			self 
			    parseOptional: aStream
			    with: clazz
			    into: decoded].
		field_type = #optionals 
		    ifTrue: 
			[first_optional 
			    ifTrue: 
				[first_optional := false.
				self prepareOptional: aStream].
			self 
			    parseOptionals: aStream
			    with: clazz
			    into: decoded]].

	"TODO: complain about unfetched bytes?"
	^decoded

]

{ #category : #encoding }
TLVDescriptionContainer >> encodeCollection: aCollection [
	| stream msg aState |
	msg := WriteStream on: (ByteArray new: 3).
	stream := aCollection readStream.
	aState := self createState.

	"Try to match the fields of the TLV description with the fields of
	 the collection. We keep some local state to check if we are
	 passed the fixed and variable fields."

	"Write the fixed portion"
	self fixedDo: 
		[:field_type :clazz | 
		self 
		    writeFixed: msg
		    with: clazz
		    from: stream next
		    state: aState].
	self writeFixedEnd: msg state: aState.

	"Write the variable portion"
	self variableDo: 
		[:field_type :clazz | 
		self 
		    writeVariable: msg
		    with: clazz
		    from: stream next
		    state: aState].
	self writeVariableEnd: msg state: aState.
	self fieldsDo: 
		[:field_type :clazz | 
		"Check if we are compatible"

		(clazz isCompatible: stream peek) 
		    ifTrue: 
			[field_type = #optional 
			    ifTrue: 
				[self 
				    writeOptional: msg
				    with: clazz
				    from: stream next
				    state: aState].
			field_type = #optionals ifTrue: [self notYetImplemented]]].
	^msg contents

]

{ #category : #fields }
TLVDescriptionContainer >> fields [
	^fields ifNil: [fields := OrderedCollection new]

]

{ #category : #fields }
TLVDescriptionContainer >> fieldsDo: aBlock [
	^self fields do: [:each | aBlock value: each first value: each second]

]

{ #category : #fields }
TLVDescriptionContainer >> filter: aFilter [
	| lst |
	lst := OrderedCollection new.
	self fields inject: lst
	    into: 
		[:list :each | 
		each first = aFilter ifTrue: [list add: each second].
		list].
	^lst

]

{ #category : #private }
TLVDescriptionContainer >> filterdDo: aBlock filter: aFilter [
	^self fields do: 
		[:each | 
		each first = aFilter ifTrue: [aBlock value: each first value: each second]]

]

{ #category : #private }
TLVDescriptionContainer >> fixed [
	^self filter: #fixed

]

{ #category : #private }
TLVDescriptionContainer >> fixedDo: aBlock [
	^self filterdDo: aBlock filter: #fixed

]

{ #category : #private }
TLVDescriptionContainer >> optional [
	^self filter: #optional

]

{ #category : #private }
TLVDescriptionContainer >> optionals [
	^self filter: #optionals

]

{ #category : #private }
TLVDescriptionContainer >> parseField: aStream with: aClass into: decoded [
	| len |
	aClass lengthLength = 0 
	    ifTrue: 
		["Is this an empty tag"

		decoded add: (aClass readVariableFrom: aStream length: 0).
		^true].
	len := (aStream next: aClass lengthLength) byteAt: 1.
	decoded add: (aClass readVariableFrom: aStream length: len).
	^true

]

{ #category : #decoding }
TLVDescriptionContainer >> parseFixed: aStream with: aClass into: decoded [
	decoded add: (aClass readFixedFrom: aStream).
	^true

]

{ #category : #decoding }
TLVDescriptionContainer >> parseOptional: aStream with: aClass into: decoded [
	| tag len |
	tag := aStream peek.
	tag = aClass parameterValue ifFalse: [^false].
	aStream skip: 1.
	self 
	    parseField: aStream
	    with: aClass
	    into: decoded.
	^true

]

{ #category : #decoding }
TLVDescriptionContainer >> parseOptionals: aStream with: aClass into: decoded [
	[self 
	    parseOptional: aStream
	    with: aClass
	    into: decoded] 
		whileTrue: []

]

{ #category : #decoding }
TLVDescriptionContainer >> parseVariable: aStream with: aClass into: decoded [
	^self 
	    parseField: aStream
	    with: aClass
	    into: decoded

]

{ #category : #decoding }
TLVDescriptionContainer >> prepareOptional: aStream [
	"Nothing to be done here. Subclasses can manipulate the stream"

]

{ #category : #accessing }
TLVDescriptionContainer >> type [
	^type

]

{ #category : #private }
TLVDescriptionContainer >> type: aType [
	type := aType

]

{ #category : #private }
TLVDescriptionContainer >> variable [
	^self filter: #variable

]

{ #category : #private }
TLVDescriptionContainer >> variableDo: aBlock [
	^self filterdDo: aBlock filter: #variable

]

{ #category : #encoding }
TLVDescriptionContainer >> writeFixed: msg with: clazz from: field state: aState [
	(clazz isCompatible: field) 
	    ifFalse: 
		[^self error: ('Mandatory information must be <1p> but was <2p>.' 
			    expandMacrosWith: clazz
			    with: field)].
	msg nextPutAll: field data

]

{ #category : #encoding }
TLVDescriptionContainer >> writeFixedEnd: aStream state: aState [
	"Subclasses can use me to do something at the end of fixed messages."

]

{ #category : #encoding }
TLVDescriptionContainer >> writeOptional: msg with: clazz from: field state: aState [
	(clazz isCompatible: field) 
	    ifFalse: 
		[^self error: ('Optional information must be <1p> but was <2p>.' 
			    expandMacrosWith: clazz
			    with: field)].

	"TODO: Respect the lengthLength here"
	msg nextPut: field class parameterValue.
	field class lengthLength > 0 
	    ifTrue: 
		[msg nextPut: field data size.
		msg nextPutAll: field data]

]

{ #category : #encoding }
TLVDescriptionContainer >> writeVariable: msg with: clazz from: field state: aState [
	(clazz isCompatible: field) 
	    ifFalse: 
		[^self error: ('Variable information must be <1p> but was <2p>.' 
			    expandMacrosWith: clazz
			    with: field)].

	"TODO: Respect the lengthLength here"
	field class lengthLength > 0 
	    ifTrue: 
		[msg nextPut: field data size.
		msg nextPutAll: field data]

]

{ #category : #encoding }
TLVDescriptionContainer >> writeVariableEnd: aStream state: aState [

]

"
I can parse a M2UA message from the wire, allow you
    to see the class, type and include tags. In C the structure will
    look like this:

struct m2ua_common_hdr {
	uint8_t version;
	uint8_t spare;
	uint8_t msg_class;
	uint8_t msg_type;
	uint32_t msg_length;
	uint8_t data[0];
} __attribute__((packed));

struct m2ua_parameter_hdr {
	uint16_t tag;
	uint16_t len;
	uint8_t data[0];
} __attribute__((packed));
	
"
Class {
	#name : #M2UAMSG,
	#superclass : #Object,
	#instVars : [
		'msg_class',
		'msg_type',
		'tags'
	],
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #parsing }
M2UAMSG class >> copyFromOtherMessage: aMsg [
	^(self new)
	    msgClass: aMsg msgClass;
	    msgType: aMsg msgType;
	    tags: aMsg tags;
	    yourself

]

{ #category : #parsing }
M2UAMSG class >> fromClass: aClass type: aType [
	^(self new)
	    instVarNamed: #msg_class put: aClass;
	    instVarNamed: #msg_type put: aType;
	    yourself

]

{ #category : #creation }
M2UAMSG class >> newMessage [
	^self new
		msgClass: self messageClass;
		msgType: self messageTag;
		yourself
]

{ #category : #parsing }
M2UAMSG class >> parseFrom: aMsg [
	self logDataContext: aMsg area: #m2ua.
	^(self new)
	    parseFrom: aMsg readStream;
	    yourself

]

{ #category : #parsing }
M2UAMSG class >> parseToClass: aMsg [
	"This will attempt to parse the message into one of the
	 available subclasses."

	| rawMsg msgClasses |
	rawMsg := self parseFrom: aMsg.

	"A simple class based lookup"
	msgClasses := 
		{M2UAASPSMMessage.
		M2UAASPTMMessage.
		M2UAASPMGMTMessage.
		M2UAMAUPMessage.}.
	msgClasses do: 
		[:msgClass | 
		rawMsg msgClass = msgClass messageClass 
		    ifTrue: 
			[msgClass allSubclassesDo: 
				[:class | 
				class messageTag = rawMsg msgType 
				    ifTrue: [^class copyFromOtherMessage: rawMsg]]]].
	^self error: ('Unknown message class (<1p>) or message type (<2p>)' 
		    expandMacrosWith: rawMsg msgClass
		    with: rawMsg msgType)

]

{ #category : #encoding }
M2UAMSG >> addTag: aTag [
	self tags add: aTag

]

{ #category : #creation }
M2UAMSG >> class: aClass [
	msg_class := aClass

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMSG >> dispatchOnAsp: anAsp [
	anAsp handleUnknownMessage: self

]

{ #category : #accessing }
M2UAMSG >> findTag: aTag [
	"I find a tag with a tag identifier"
	^self findTag: aTag ifAbsent: [nil]

]

{ #category : #accessing }
M2UAMSG >> findTag: aTag ifAbsent: aBlock [
	"I find a tag with a tag identifier"
	self tags do: [:each | (each isTag: aTag) ifTrue: [^each]].
	^aBlock value

]

{ #category : #accessing }
M2UAMSG >> msgClass [
	^msg_class

]

{ #category : #creation }
M2UAMSG >> msgClass: aClass [
	self class: aClass

]

{ #category : #accessing }
M2UAMSG >> msgType [
	^msg_type

]

{ #category : #creation }
M2UAMSG >> msgType: aType [
	msg_type := aType

]

{ #category : #parsing }
M2UAMSG >> parseFrom: aStream [
	| len |
	self parseVersion: aStream.
	self parseSpare: aStream.
	msg_class := aStream next.
	msg_type := aStream next.
	len := self parseLength: aStream.
	tags := self parseTags: aStream to: aStream position + len - 8

]

{ #category : #parsing }
M2UAMSG >> parseLength: aStream [
	| len |
	len := ((aStream next: 4) uintAt: 1) swap32.
	aStream size - aStream position < (len - 8) 
	    ifTrue: 
		[self 
		    logError: ('M2UA length is not plausible <1p> <2p>.' expandMacrosWith: len
			    with: aStream size - aStream position)
		    area: #m2ua.
		self 
		    error: ('M2UA length is not plausible <1p> <2p>.' expandMacrosWith: len
			    with: aStream size - aStream position)].
	^len

]

{ #category : #parsing }
M2UAMSG >> parseSpare: aStream [
	| spare |
	spare := aStream next.
	spare = M2UAConstants spare 
	    ifFalse: 
		[self logError: ('M2UA spare is wrong <1p>.' expandMacrosWith: spare)
		    area: #m2ua.
		self error: ('M2UA spare is wrong <1p>.' expandMacrosWith: spare)]

]

{ #category : #parsing }
M2UAMSG >> parseTags: aStream to: end [
	tags := OrderedCollection new.
	[aStream position < end] 
	    whileTrue: [tags add: (M2UATag fromStream: aStream)].
	^tags

]

{ #category : #parsing }
M2UAMSG >> parseVersion: aStream [
	| version |
	version := aStream next.
	version = M2UAConstants version 
	    ifFalse: 
		[self logError: ('M2UA version is wrong <1p>.' expandMacrosWith: version)
		    area: #m2ua.
		self error: ('M2UA version is wrong <1p>.' expandMacrosWith: version)]

]

{ #category : #private }
M2UAMSG >> tags [
	^tags ifNil: [tags := OrderedCollection new]

]

{ #category : #creation }
M2UAMSG >> tags: aTags [
	tags := aTags

]

{ #category : #private }
M2UAMSG >> writeOn: aMsg [
	| tag_data |
	tag_data := MessageBuffer new.

	"Create the tag data"
	self tags do: [:each | each writeOn: tag_data].
	aMsg putByte: M2UAConstants version.
	aMsg putByte: M2UAConstants spare.
	aMsg putByte: msg_class.
	aMsg putByte: msg_type.
	aMsg putLen32: tag_data size + 8.
	aMsg putByteArray: tag_data

]

"
I am another attempt to express optional and mandatory fields.
"
Class {
	#name : #TLVDescription,
	#superclass : #Object,
	#instVars : [
		'tag',
		'kind',
		'parse_class',
		'type',
		'inst_var',
		'min_size',
		'max_size',
		'len_size',
		'force_tag',
		'direct_write'
	],
	#category : #OsmoTLV
}

{ #category : #presence }
TLVDescription class >> conditional [
	^#conditional

]

{ #category : #type }
TLVDescription class >> lengthValue [
	^#lv

]

{ #category : #presence }
TLVDescription class >> mandatory [
	^#mandatory

]

{ #category : #creation }
TLVDescription class >> new [
	^(super basicNew)
	    initialize;
	    yourself

]

{ #category : #presence }
TLVDescription class >> optional [
	^#optional

]

{ #category : #type }
TLVDescription class >> tagLengthValue [
	^#tlv

]

{ #category : #type }
TLVDescription class >> tagOnly [
	^#tagOnly

]

{ #category : #type }
TLVDescription class >> tagValue [
	^#tv

]

{ #category : #type }
TLVDescription class >> valueOnly [
	^#valueOnly

]

{ #category : #creation }
TLVDescription >> beConditional [
	self presenceKind: self class conditional

]

{ #category : #creation }
TLVDescription >> beForceTagged [
	"Write a tag even if this element is mandatory"
	force_tag := true

]

{ #category : #creation }
TLVDescription >> beLV [
	self typeKind: self class lengthValue

]

{ #category : #creation }
TLVDescription >> beLen16 [
	len_size := 2

]

{ #category : #creation }
TLVDescription >> beOptional [
	self presenceKind: self class optional

]

{ #category : #creation }
TLVDescription >> beTLV [
	self typeKind: self class tagLengthValue

]

{ #category : #creation }
TLVDescription >> beTV [
	self typeKind: self class tagValue

]

{ #category : #creation }
TLVDescription >> beTagOnly [
	self typeKind: self class tagOnly

]

{ #category : #'as yet unclassified' }
TLVDescription >> delegateWrite [
	^direct_write not
]

{ #category : #access }
TLVDescription >> hasLength [
	^type = self class tagLengthValue or: [type = self class lengthValue]

]

{ #category : #access }
TLVDescription >> hasTag [
	^type ~= self class lengthValue and: [type ~= self class valueOnly]

]

{ #category : #creation }
TLVDescription >> initialize [
	kind := self class mandatory.
	type := self class tagLengthValue.
	len_size := 1.
	force_tag := false.
	direct_write := true.

]

{ #category : #accessing }
TLVDescription >> instVarName [
	^inst_var

]

{ #category : #creation }
TLVDescription >> instVarName: aName [
	inst_var := aName

]

{ #category : #access }
TLVDescription >> isConditional [
	^kind = self class conditional

]

{ #category : #access }
TLVDescription >> isFixedSize [
	^type = self class tagValue or: [type = self class valueOnly]

]

{ #category : #access }
TLVDescription >> isForcedTag [
	^force_tag

]

{ #category : #access }
TLVDescription >> isLen16 [
	^self hasLength and: [len_size = 2]

]

{ #category : #access }
TLVDescription >> isLen8 [
	^self hasLength and: [len_size = 1]

]

{ #category : #accessing }
TLVDescription >> isList [
	^false
]

{ #category : #access }
TLVDescription >> isMandatory [
	^kind = self class mandatory

]

{ #category : #access }
TLVDescription >> isOptional [
	^kind = self class optional

]

{ #category : #'as yet unclassified' }
TLVDescription >> minSize: aMin [
	min_size := aMin.
	max_size := nil

]

{ #category : #size }
TLVDescription >> minSize: aMin maxSize: aMax [
	"This only makes sense for *LV elements"
	min_size := aMin.
	max_size := aMax

]

{ #category : #access }
TLVDescription >> needsTag [
	^force_tag 
	    or: [self hasTag and: [self isOptional or: [self isConditional]]]

]

{ #category : #creation }
TLVDescription >> parseClass [
	^parse_class

]

{ #category : #creation }
TLVDescription >> parseClass: aClass [
	"The class to be used to parse this"
	parse_class := aClass

]

{ #category : #'as yet unclassified' }
TLVDescription >> parseFrom: aStream to: aSelf [ 
	self parseClass isNil ifTrue: [^aSelf error: 'No parse class available'].
	aSelf instVarNamed: self instVarName
	    put: (self parseClass readFrom: aStream with: self).
	^true
]

{ #category : #creation }
TLVDescription >> presenceKind: aKind [
	"Is this required, optional, variable?"
	kind := aKind

]

{ #category : #access }
TLVDescription >> tag [
	"The tag value for this tag inside the bytestream"
	^tag

]

{ #category : #creation }
TLVDescription >> tag: aTag [
	tag := aTag

]

{ #category : #accessing }
TLVDescription >> typeKind [
	^type

]

{ #category : #creation }
TLVDescription >> typeKind: aType [
	type := aType

]

{ #category : #'as yet unclassified' }
TLVDescription >> useDelegatedWrite [
	direct_write := false.
]

{ #category : #'as yet unclassified' }
TLVDescription >> valueSize [
	^max_size

]

{ #category : #size }
TLVDescription >> valueSize: aSize [
	^self minSize: aSize maxSize: aSize

]

{ #category : #'as yet unclassified' }
TLVDescription >> write: aValue on: aMsg [
	self needsTag ifTrue: [aMsg putByte: self tag].
	self delegateWrite
		ifTrue: [self parseClass write: aValue on: aMsg with: self]
		ifFalse: [aValue writeOn: aMsg with: self]
]

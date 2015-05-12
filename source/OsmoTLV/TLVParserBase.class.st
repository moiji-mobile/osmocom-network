"
I am the base class for TLV like parsers. I provide common
    routines for parsing.
"
Class {
	#name : #TLVParserBase,
	#superclass : #Object,
	#category : #OsmoTLV
}

{ #category : #parsing }
TLVParserBase >> doParse: attr stream: aStream [
	^attr parseFrom: aStream to: self

]

{ #category : #parsing }
TLVParserBase >> parseConditional: attr tag: aTag stream: aStream [
	^self 
	    parseOptional: attr
	    tag: aTag
	    stream: aStream

]

{ #category : #parsing }
TLVParserBase >> parseMandatory: attr tag: aTag stream: aStream [
	aTag = attr tag 
	    ifFalse: 
		[^self error: ('Mandatory <1p> element is missing' 
			    expandMacrosWith: attr instVarName)].
	aStream skip: 1.
	self doParse: attr stream: aStream

]

{ #category : #parsing }
TLVParserBase >> parseOptional: attr tag: aTag stream: aStream [
	aTag = attr tag ifFalse: [^false].
	aStream skip: 1.
	self doParse: attr stream: aStream

]

{ #category : #serialize }
TLVParserBase >> writeOn: aMsg [
	"Write the header"
	self writeHeaderOn: aMsg.

	"Write each element"
	self class tlvDescription do: 
		[:attr | 
		| val |
		val := self instVarNamed: attr instVarName.

		"Check if it may be nil"
		(val isNil and: [attr isMandatory]) 
		    ifTrue: [^self error: 'Mandatory parameter is nil.'].

		"Now write it"
		val ifNotNil: [
			attr write: val on: aMsg]]
]

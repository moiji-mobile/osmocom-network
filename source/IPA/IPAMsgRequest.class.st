"
I can parse the IPA messages and generate them
"
Class {
	#name : #IPAMsgRequest,
	#superclass : #Object,
	#instVars : [
		'data',
		'type'
	],
	#category : #IPA
}

{ #category : #parsing }
IPAMsgRequest class >> parse: aStream [
	| type data |
	type := aStream next.
	"TLV parser for the IPAMessage"
	data := self parseTLV: aStream.
	^(self new)
	    type: type;
	    data: data;
	    yourself

]

{ #category : #parsing }
IPAMsgRequest class >> parseTLV: aStream [
	| data |
	data := OrderedCollection new.
	[aStream atEnd] whileFalse: 
		[| len tag msg |
		len := aStream next.
		tag := aStream next.

		"On requests the length counts the tag"
		msg := len > 1 ifTrue: [aStream next: len] ifFalse: [nil].
		data add: (Association key: tag value: msg)].
	^data

]

{ #category : #data }
IPAMsgRequest >> data: aData [
	data := aData

]

{ #category : #accessing }
IPAMsgRequest >> dataForTag: aTag [
	data do: [:each | each key = aTag ifTrue: [^each value]].
	^NotFound signalOn: self what: 'Tag ' , aTag asString , ' not found'

]

{ #category : #accessing }
IPAMsgRequest >> hasTag: aTag [
	^self tags includes: aTag

]

{ #category : #accessing }
IPAMsgRequest >> tags [
	^data collect: [:each | each key]

]

{ #category : #data }
IPAMsgRequest >> type: aType [
	type := aType

]

{ #category : #serialize }
IPAMsgRequest >> writeOn: aMsg [
	aMsg putByte: type.
	self writeTLV: aMsg

]

{ #category : #serialize }
IPAMsgRequest >> writeTLV: aMsg [
	data do: 
		[:each | 
		"Write the length and tag"

		aMsg
		    putByte: 1 + each value basicSize;
		    putByte: each key.

		"Write the optional value"
		each value isNil ifFalse: [aMsg putByteArray: each value]]

]

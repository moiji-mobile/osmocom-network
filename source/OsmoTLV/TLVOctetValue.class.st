"
I am a generic base for attributes that are bytearrays
"
Class {
	#name : #TLVOctetValue,
	#superclass : #Object,
	#category : #OsmoTLV
}

{ #category : #'as yet unclassified' }
TLVOctetValue class >> readFrom: aStream with: aDescription [
	| len |
	len := aStream next.
	^aStream next: len
]

{ #category : #'as yet unclassified' }
TLVOctetValue class >> write: aByteArray on: aMessage with: aDescription [
	aMessage
		nextPut: aByteArray size;
		nextPutAll: aByteArray.
]

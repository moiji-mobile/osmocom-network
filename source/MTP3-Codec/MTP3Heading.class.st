"
Encoding/Decoding of the Heading code H0 and Heading code H1. Please refer to MTP3MSG for the possible h0 and h1 values.
"
Class {
	#name : #MTP3Heading,
	#superclass : #MTP3Field,
	#instVars : [
		'h0',
		'h1'
	],
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3Heading class >> parseFrom: aStream [
	| byte |
	byte := aStream next.
	^(self new)
	    h0: (byte bitAnd: 2r1111);
	    h1: (byte bitShift: -4);
	    yourself

]

{ #category : #accessing }
MTP3Heading >> h0 [
	^h0

]

{ #category : #creation }
MTP3Heading >> h0: aHeading [
	h0 := aHeading

]

{ #category : #accessing }
MTP3Heading >> h1 [
	^h1

]

{ #category : #creation }
MTP3Heading >> h1: aHeading [
	h1 := aHeading

]

{ #category : #encoding }
MTP3Heading >> writeOn: aBuffer [
	| byte |
	byte := h0 bitOr: (h1 bitShift: 4).
	aBuffer putByte: byte

]

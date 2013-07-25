"
I represent messages specified in Q.707
"
Class {
	#name : #MTP3LinkTestMSG,
	#superclass : #MTP3MSG,
	#instVars : [
		'pattern'
	],
	#category : #'MTP3-Codec'
}

{ #category : #parsing }
MTP3LinkTestMSG class >> findClassForHeading: aHeading [
	aHeading h0 = self h0 ifFalse: [^self error: 'Wrong heading'].
	self subclassesDo: [:each | each h1 = aHeading h1 ifTrue: [^each]]

]

{ #category : #'as yet unclassified' }
MTP3LinkTestMSG class >> h0 [
	^2r0001

]

{ #category : #'as yet unclassified' }
MTP3LinkTestMSG class >> h1SLTA [
	^2r0010

]

{ #category : #'as yet unclassified' }
MTP3LinkTestMSG class >> h1SLTM [
	^2r0001

]

{ #category : #parsing }
MTP3LinkTestMSG class >> isServiceCompatible: aServiceIndicator [
	^aServiceIndicator serviceIndicator 
	    = MTP3ServiceIndicators signallingNetworkTestingAndMaintenance

]

{ #category : #parsing }
MTP3LinkTestMSG >> parseFrom: aStream [
	| length |
	length := aStream next bitShift: -4.
	self testPattern: (aStream next: length)

]

{ #category : #parsing }
MTP3LinkTestMSG >> testPattern [
	^pattern

]

{ #category : #creation }
MTP3LinkTestMSG >> testPattern: aPattern [
	pattern := aPattern

]

{ #category : #encoding }
MTP3LinkTestMSG >> writeOn: aBuffer [
	| len |
	super writeOn: aBuffer.
	len := (pattern size bitShift: 4) bitAnd: 2r11110000.
	aBuffer putByte: len.
	aBuffer putByteArray: pattern

]

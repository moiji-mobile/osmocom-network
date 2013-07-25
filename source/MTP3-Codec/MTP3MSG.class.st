Class {
	#name : #MTP3MSG,
	#superclass : #MTP3BaseMSG,
	#instVars : [
		'heading'
	],
	#category : #'MTP3-Codec'
}

{ #category : #parsing }
MTP3MSG class >> findMessageClassFor: aServiceIndicator heading: aHeading [
	self subclassesDo: 
		[:each | 
		(each isServiceCompatible: aServiceIndicator) 
		    ifTrue: [^each findClassForHeading: aHeading]].
	^nil

]

{ #category : #creation }
MTP3MSG class >> new [
	^super new
		heading: (MTP3Heading new
					h0: self h0;
					h1: self h1;
					yourself);
		yourself
]

{ #category : #parsing }
MTP3MSG class >> parseFrom: aStream [
	| service label heading msg |
	service := MTP3ServiceIndicators parseFrom: aStream.
	label := MTP3Label parseFrom: aStream.

	"This is lacking some object orientation but is good enough for now"
	service isSccp ifTrue: [
		^MTP3DataMSG new
			service: service;
			label: label;
			data: aStream upToEnd;
			yourself
	].
	
	heading := MTP3Heading parseFrom: aStream.
	msg := ((self findMessageClassFor: service heading: heading) new)
		    service: service;
		    label: label;
		    heading: heading;
		    parseFrom: aStream;
		    yourself.
	^msg

]

{ #category : #creation }
MTP3MSG >> heading: aHeading [
	heading := aHeading

]

{ #category : #encoding }
MTP3MSG >> writeOn: aBuffer [
	super writeOn: aBuffer.
	heading writeOn: aBuffer.
]

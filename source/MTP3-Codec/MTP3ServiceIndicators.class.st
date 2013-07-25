"
I represent a Q.704 14.2.1 service Indicator and 14.2.2 sub-service field
"
Class {
	#name : #MTP3ServiceIndicators,
	#superclass : #MTP3Field,
	#instVars : [
		'serviceIndicator',
		'subServiceField'
	],
	#category : #'MTP3-Codec'
}

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> broadbandIsdnUserPart [
	^2r1001

]

{ #category : #'as yet unclassified' }
MTP3ServiceIndicators class >> createIndicatorForSCCP [
	^ self new
		serviceIndicator: self sccp;
		subServiceField: 0;
		yourself
]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> dataUserPartCallAndCircuit [
	^2r0110

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> dataUserPartFacilityAndCancellation [
	^2r0111

]

{ #category : #'subservice-indicators' }
MTP3ServiceIndicators class >> internationalNetwork [
	^2r0000

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> isdnUserPart [
	^2r0101

]

{ #category : #'subservice-indicators' }
MTP3ServiceIndicators class >> nationalNetwork [
	^2r1000

]

{ #category : #parsing }
MTP3ServiceIndicators class >> parseFrom: aStream [
	| byte |
	byte := aStream next.
	^(self new)
	    serviceIndicator: (byte bitAnd: 2r1111);
	    subServiceField: (byte bitShift: -4);
	    yourself

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> reservedMtpTestingUserPart [
	^2r1000

]

{ #category : #'subservice-indicators' }
MTP3ServiceIndicators class >> reservedNationalUse [
	^2r1100

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> satelliteIsdnUserPart [
	^2r1010

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> sccp [
	^2r0011

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> serviceSpare [
	^2r0010

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> signallingNetworkManagement [
	^2r0000

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> signallingNetworkTestingAndMaintenance [
	^2r0001

]

{ #category : #'subservice-indicators' }
MTP3ServiceIndicators class >> subServiceSpare [
	^2r0100

]

{ #category : #'service-indicators' }
MTP3ServiceIndicators class >> telephoneUserPart [
	^2r0100

]

{ #category : #querying }
MTP3ServiceIndicators >> isSccp [
	^self serviceIndicator = self class sccp
]

{ #category : #accessing }
MTP3ServiceIndicators >> serviceIndicator [
	^serviceIndicator

]

{ #category : #creation }
MTP3ServiceIndicators >> serviceIndicator: anIndicator [
	serviceIndicator := anIndicator

]

{ #category : #accessing }
MTP3ServiceIndicators >> subServiceField [
	^subServiceField

]

{ #category : #creation }
MTP3ServiceIndicators >> subServiceField: aSubServiceField [
	subServiceField := aSubServiceField

]

{ #category : #encoding }
MTP3ServiceIndicators >> writeOn: aMsg [
	| data |
	data := (subServiceField bitShift: 4) bitAnd: 2r11110000.
	data := (serviceIndicator bitAnd: 2r1111) bitOr: data.
	aMsg putByte: data

]

Class {
	#name : #SCCPUDTS,
	#superclass : #SCCPMessage,
	#instVars : [
		'calledAddr',
		'callingAddr',
		'returnCause',
		'data'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #'as yet unclassified' }
SCCPUDTS class >> initWith: aCalled calling: aCalling returnCause: aCause data: aData [
	^self new
		calledAddr: aCalled;
		callingAddr: aCalling;
		returnCause: aCause;
		data: aData;
		yourself
		
]

{ #category : #'as yet unclassified' }
SCCPUDTS class >> msgType [
	^SCCPHelper msgUdts

]

{ #category : #'as yet unclassified' }
SCCPUDTS class >> parseFrom: aByteArray [
	| cause called calledData calling callingData data dataData dataSize |
	cause := aByteArray at: 2.
	called := aByteArray at: 3.
	calling := aByteArray at: 4.
	data := aByteArray at: 5.

	calledData := aByteArray copyFrom: 3 + called to: aByteArray size.
	callingData := aByteArray copyFrom: 4 + calling to: aByteArray size.
	dataSize := aByteArray at: 5 + data.
	dataData := aByteArray copyFrom: 6 + data to: 5 + data + dataSize.

	^SCCPUDTS
	    initWith: (SCCPAddress parseFrom: calledData)
	    calling: (SCCPAddress parseFrom: callingData)
	    returnCause: cause
	    data: dataData
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> calledAddr [
	^ calledAddr
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> calledAddr: aCalledAddress [
	calledAddr := aCalledAddress
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> callingAddr [
	^ callingAddr
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> callingAddr: aCallingAddress [
	callingAddr := aCallingAddress
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> data [
	^ data
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> data: aData [
	data := aData
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> returnCause: aCause [
	returnCause := aCause
]

{ #category : #'as yet unclassified' }
SCCPUDTS >> writeOn: aMsg [
	| calledData callingData dat |
	calledData := calledAddr asByteArray.
	callingData := callingAddr asByteArray.
	aMsg putByte: self class msgType.
	aMsg putByte: returnCause.

	"pointers"
	aMsg putByte: 3.
	aMsg putByte: 1 + calledData size + 1.
	aMsg putByte: calledData size + callingData size + 1.

	"the data"
	aMsg putByteArray: calledData.
	aMsg putByteArray: callingData.
	dat := data toMessageOrByteArray.
	aMsg putByte: dat size.
	aMsg putByteArray: dat

]

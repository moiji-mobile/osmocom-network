"
I hold the data of an extended connection less data message.
"
Class {
	#name : #SCCPXUDT,
	#superclass : #SCCPMessage,
	#instVars : [
		'hopCounter',
		'called',
		'calling',
		'data',
		'error',
		'udtClass',
		'optionalParameters'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #'as yet unclassified' }
SCCPXUDT class >> initWith: aCalled calling: aCalling data: aData [
	^(self new)
	    calledAddr: aCalled;
	    callingAddr: aCalling;
	    data: aData;
	    yourself

]

{ #category : #'as yet unclassified' }
SCCPXUDT class >> msgType [
	^SCCPHelper msgXudt

]

{ #category : #'as yet unclassified' }
SCCPXUDT class >> parseFrom: aByteArray [
	|  stream classAndError hopCounter calledAddressOffset calledAddressPos callingAddressOffset callingAddressPos  optionalOffset optionalPos dataOffset dataPos  calledData  callingData  dataSize dataData optionalParameters |
	stream := aByteArray readStream.
	
	"Skip the type"
	stream skip: 1.
	classAndError := stream next.
	hopCounter := stream next.

	"Read pointers"
	calledAddressOffset := stream next.
	calledAddressPos := stream position.
	callingAddressOffset := stream next.
	callingAddressPos := stream position.
	dataOffset := stream next.
	dataPos := stream position.
	optionalOffset := stream next.
	optionalPos := stream position.

	"TODO: Position the stream and read again."
	calledData := aByteArray copyFrom: calledAddressPos + calledAddressOffset to: aByteArray size.
	callingData := aByteArray copyFrom: callingAddressPos + callingAddressOffset to: aByteArray size.
	dataSize := aByteArray at: dataOffset + dataPos.
	dataData := aByteArray copyFrom: dataOffset + dataPos + 1 to: dataOffset + dataPos + dataSize.

	"Handle optional data."
	optionalParameters := SCCPPNC parseFrom: (aByteArray copyFrom: optionalPos + optionalOffset to: aByteArray size).

	^(SCCPXUDT 
	    initWith: (SCCPAddress parseFrom: calledData)
	    calling: (SCCPAddress parseFrom: callingData)
	    data: dataData)
	    udtClass: (classAndError bitAnd: 16r0F);
	    hopCounter: hopCounter;
	    errorHandling: (classAndError bitShift: -4);
	    optionalParameters: optionalParameters;
	    yourself

]

{ #category : #'as yet unclassified' }
SCCPXUDT >> calledAddr [
	^called
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> calledAddr: aSCCPAddress [ 
	called := aSCCPAddress
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> callingAddr [
	^calling
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> callingAddr: aSCCPAddress [ 
	calling := aSCCPAddress
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> data [
	^ data
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> data: aCollection [ 
	data := aCollection
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> errorHandling [
	^error
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> errorHandling: anInteger [ 
	error := anInteger
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> hopCounter [
	^hopCounter
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> hopCounter: anInteger [ 
	hopCounter := anInteger
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> initialize [
	super initialize.
	optionalParameters := Dictionary new.
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> isSegmented [
	^optionalParameters dict includesKey: SCCPHelper pncSegmentation
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> optionalParameters: parameters [
	optionalParameters := parameters
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> parseSegmentation [
	| segmentationData  |
	"This is handling 3.17 of Q.713 and should probably be done
	earlier."
	segmentationData := optionalParameters at: SCCPHelper pncSegmentation.
	^SCCPSegmentation readFrom: segmentationData readStream.


]

{ #category : #'as yet unclassified' }
SCCPXUDT >> udtClass [
	^udtClass
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> udtClass: anInteger [ 
	udtClass := anInteger
]

{ #category : #'as yet unclassified' }
SCCPXUDT >> writeOn: aMsg [
	| calledData callingData dat |
	calledData := called asByteArray.
	callingData := calling asByteArray.
	dat := data toMessageOrByteArray.

	aMsg putByte: self class msgType.
	aMsg putByte: (((self errorHandling bitAnd: 16r0F) bitShift: 4) 
		    bitOr: self udtClass).
	aMsg putByte: self hopCounter.

	"pointers. From where the data will actually start."
	aMsg putByte: 4.
	aMsg putByte: 2 + calledData size + 1.
	aMsg putByte: 1 + calledData size + callingData size + 1.
	aMsg putByte: (optionalParameters isEmpty
						ifTrue: [0]
						ifFalse: [calledData size + callingData size + dat size + 1 + 1]).

	"the data"
	aMsg putByteArray: calledData.
	aMsg putByteArray: callingData.
	aMsg putByte: dat size.
	aMsg putByteArray: dat.

	optionalParameters isEmpty
		ifFalse: [optionalParameters writeOn: aMsg].

]

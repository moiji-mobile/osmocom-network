"
I hold the data of a connection less data message.
"
Class {
	#name : #SCCPUDT,
	#superclass : #SCCPMessage,
	#instVars : [
		'called',
		'calling',
		'data',
		'error',
		'udtClass'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPUDT class >> initWith: aCalled calling: aCalling data: aData [
	^(self new)
	    calledAddr: aCalled;
	    callingAddr: aCalling;
	    data: aData;
	    yourself

]

{ #category : #fields }
SCCPUDT class >> msgType [
	^SCCPHelper msgUdt

]

{ #category : #parsing }
SCCPUDT class >> parseFrom: aByteArray [
	| called calledData calling callingData data dataData dataSize |
	called := aByteArray at: 3.
	calledData := aByteArray copyFrom: 3 + called to: aByteArray size.
	calling := aByteArray at: 4.
	callingData := aByteArray copyFrom: 4 + calling to: aByteArray size.
	data := aByteArray at: 5.
	dataSize := aByteArray at: 5 + data.
	dataData := aByteArray copyFrom: 6 + data to: 5 + data + dataSize.
	^(SCCPUDT 
	    initWith: (SCCPAddress parseFrom: calledData)
	    calling: (SCCPAddress parseFrom: callingData)
	    data: dataData)
	    udtClass: ((aByteArray at: 2) bitAnd: 16r0F);
	    errorHandling: ((aByteArray at: 2) bitShift: -4);
	    yourself

]

{ #category : #accessing }
SCCPUDT >> calledAddr [
	^called

]

{ #category : #accessing }
SCCPUDT >> calledAddr: aCalled [
	called := aCalled

]

{ #category : #accessing }
SCCPUDT >> callingAddr [
	^calling

]

{ #category : #accessing }
SCCPUDT >> callingAddr: aCalling [
	calling := aCalling

]

{ #category : #accessing }
SCCPUDT >> data [
	^data

]

{ #category : #accessing }
SCCPUDT >> data: aData [
	data := aData

]

{ #category : #accessing }
SCCPUDT >> errorHandling [
	^error ifNil: [0]

]

{ #category : #accessing }
SCCPUDT >> errorHandling: aStrategy [
	error := aStrategy

]

{ #category : #accessing }
SCCPUDT >> udtClass [
	^udtClass ifNil: [0]

]

{ #category : #accessing }
SCCPUDT >> udtClass: aClass [
	udtClass := aClass

]

{ #category : #encoding }
SCCPUDT >> writeOn: aMsg [
	| calledData callingData dat |
	calledData := called asByteArray.
	callingData := calling asByteArray.
	aMsg putByte: self class msgType.
	aMsg putByte: (((self errorHandling bitAnd: 16r0F) bitShift: 4) 
		    bitOr: self udtClass).

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

"
I hold the data of a data memssage.
"
Class {
	#name : #SCCPConnectionData,
	#superclass : #SCCPMessage,
	#instVars : [
		'dst',
		'data'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPConnectionData class >> initWith: dst data: data [
	^(self new)
	    dst: dst;
	    data: data;
	    yourself

]

{ #category : #factory }
SCCPConnectionData class >> msgType [
	^SCCPHelper msgDt1

]

{ #category : #parsing }
SCCPConnectionData class >> parseFrom: aByteArray [
	| more_data var_start addr size data |
	addr := SCCPAddrReference 
		    fromByteArray: (aByteArray copyFrom: 2 to: aByteArray size).
	more_data := aByteArray at: 5.
	more_data = 0 ifFalse: [Error signal: 'Fragmented data is not supported.'].
	var_start := aByteArray at: 6.
	size := aByteArray at: 6 + var_start.
	data := aByteArray copyFrom: 6 + var_start + 1 to: 6 + var_start + size.
	^SCCPConnectionData initWith: addr data: data

]

{ #category : #accessing }
SCCPConnectionData >> data [
	^data

]

{ #category : #private }
SCCPConnectionData >> data: aData [
	data := aData.
	data size > 16rFF 
	    ifTrue: 
		[self error: ('Data must be < 256 in size but was <1p>' 
			    expandMacrosWith: data size)]

]

{ #category : #accessing }
SCCPConnectionData >> dst [
	^dst

]

{ #category : #private }
SCCPConnectionData >> dst: aDst [
	dst := aDst

]

{ #category : #encoding }
SCCPConnectionData >> writeOn: aMsg [
	| dat |
	aMsg putByte: self class msgType.
	SCCPAddrReference store: dst on: aMsg.
	aMsg putByte: 0.
	aMsg putByte: 1.
	dat := data toMessageOrByteArray.
	aMsg putByte: dat size.
	aMsg putByteArray: dat.
	^aMsg

]

"
I hold the data of a connection refused.
"
Class {
	#name : #SCCPConnectionRefused,
	#superclass : #SCCPMessage,
	#instVars : [
		'dst',
		'cause'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPConnectionRefused class >> initWithDst: aDst cause: aCause [
	^(self new)
	    dst: aDst;
	    cause: aCause;
	    yourself

]

{ #category : #factory }
SCCPConnectionRefused class >> msgType [
	^SCCPHelper msgCref

]

{ #category : #parsing }
SCCPConnectionRefused class >> parseFrom: aMsg [
	| dst cause |
	dst := SCCPAddrReference fromByteArray: (aMsg copyFrom: 2 to: 4).
	cause := aMsg at: 5.
	^self initWithDst: dst cause: cause

]

{ #category : #'as yet unclassified' }
SCCPConnectionRefused >> cause [
	^cause

]

{ #category : #'as yet unclassified' }
SCCPConnectionRefused >> cause: aCause [
	cause := aCause

]

{ #category : #'as yet unclassified' }
SCCPConnectionRefused >> dst [
	^dst

]

{ #category : #'as yet unclassified' }
SCCPConnectionRefused >> dst: aDst [
	dst := aDst

]

{ #category : #encoding }
SCCPConnectionRefused >> writeOn: aMsg [
	aMsg putByte: self class msgType.
	SCCPAddrReference store: dst on: aMsg.
	aMsg putByte: cause.

	"End of optional?"
	aMsg
	    putByte: 1;
	    putByte: 0

]

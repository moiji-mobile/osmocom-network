"
I hold the data of a connection release message.
"
Class {
	#name : #SCCPConnectionReleased,
	#superclass : #SCCPMessage,
	#instVars : [
		'src',
		'dst',
		'cause',
		'pnc'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPConnectionReleased class >> initWithDst: aDst src: aSrc cause: aCause [
	^(self new)
	    dst: aDst;
	    src: aSrc;
	    cause: aCause;
	    yourself

]

{ #category : #factory }
SCCPConnectionReleased class >> msgType [
	^SCCPHelper msgRlsd

]

{ #category : #parsing }
SCCPConnectionReleased class >> parseFrom: aByteArray [
	| dst src cause |
	dst := SCCPAddrReference 
		    fromByteArray: (aByteArray copyFrom: 2 to: aByteArray size).
	src := SCCPAddrReference 
		    fromByteArray: (aByteArray copyFrom: 5 to: aByteArray size).
	cause := aByteArray at: 8.
	^SCCPConnectionReleased 
	    initWithDst: dst
	    src: src
	    cause: cause

]

{ #category : #accessing }
SCCPConnectionReleased >> cause [
	^cause

]

{ #category : #accessing }
SCCPConnectionReleased >> cause: aCause [
	cause := aCause

]

{ #category : #accessing }
SCCPConnectionReleased >> dst [
	^dst

]

{ #category : #accessing }
SCCPConnectionReleased >> dst: aDst [
	dst := aDst

]

{ #category : #accessing }
SCCPConnectionReleased >> pnc [
	^pnc ifNil: [pnc := SCCPPNC new]

]

{ #category : #accessing }
SCCPConnectionReleased >> src [
	^src

]

{ #category : #accessing }
SCCPConnectionReleased >> src: aSrc [
	src := aSrc

]

{ #category : #encoding }
SCCPConnectionReleased >> writeOn: aMsg [
	aMsg putByte: self class msgType.
	SCCPAddrReference store: dst on: aMsg.
	SCCPAddrReference store: src on: aMsg.
	aMsg putByte: cause.
	aMsg putByte: 1.
	self pnc writeOn: aMsg

]

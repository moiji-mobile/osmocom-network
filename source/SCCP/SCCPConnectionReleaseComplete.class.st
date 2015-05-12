"
I hold the data of a released connection.
"
Class {
	#name : #SCCPConnectionReleaseComplete,
	#superclass : #SCCPMessage,
	#instVars : [
		'dst',
		'src'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPConnectionReleaseComplete class >> initWithDst: aDst src: aSrc [
	^(self new)
	    dst: aDst;
	    src: aSrc;
	    yourself

]

{ #category : #fields }
SCCPConnectionReleaseComplete class >> msgType [
	^SCCPHelper msgRlc

]

{ #category : #parsing }
SCCPConnectionReleaseComplete class >> parseFrom: aByteArray [
	^(self new)
	    dst: (SCCPAddrReference fromByteArray: (aByteArray copyFrom: 2 to: 4));
	    src: (SCCPAddrReference fromByteArray: (aByteArray copyFrom: 5 to: 7));
	    yourself

]

{ #category : #accessing }
SCCPConnectionReleaseComplete >> dst [
	^dst

]

{ #category : #accessing }
SCCPConnectionReleaseComplete >> dst: aDst [
	dst := aDst

]

{ #category : #accessing }
SCCPConnectionReleaseComplete >> src [
	^src

]

{ #category : #accessing }
SCCPConnectionReleaseComplete >> src: aSrc [
	src := aSrc

]

{ #category : #encoding }
SCCPConnectionReleaseComplete >> writeOn: aMsg [
	aMsg putByte: self class msgType.
	SCCPAddrReference store: dst on: aMsg.
	SCCPAddrReference store: src on: aMsg

]

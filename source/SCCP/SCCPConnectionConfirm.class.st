"
I hold the data of a connection confirm.
"
Class {
	#name : #SCCPConnectionConfirm,
	#superclass : #SCCPMessage,
	#instVars : [
		'src',
		'dst',
		'pnc'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPConnectionConfirm class >> initWithSrc: aSrc dst: aDst [
	^(self new)
	    src: aSrc dst: aDst;
	    yourself

]

{ #category : #factory }
SCCPConnectionConfirm class >> msgType [
	^SCCPHelper msgCc

]

{ #category : #parsing }
SCCPConnectionConfirm class >> parseFrom: aMsg [
	| src dst proto optional |
	dst := SCCPAddrReference fromByteArray: (aMsg copyFrom: 2 to: 4).
	src := SCCPAddrReference fromByteArray: (aMsg copyFrom: 5 to: 7).
	proto := aMsg at: 8.
	optional := aMsg at: 9.

	"TODO: Add additional items"
	^(self new)
	    src: src dst: dst;
	    yourself

]

{ #category : #accessing }
SCCPConnectionConfirm >> dst [
	^dst

]

{ #category : #accessing }
SCCPConnectionConfirm >> pnc [
	^pnc ifNil: [pnc := SCCPPNC new]

]

{ #category : #accessing }
SCCPConnectionConfirm >> src [
	^src

]

{ #category : #accessing }
SCCPConnectionConfirm >> src: aSrc dst: aDst [
	src := aSrc.
	dst := aDst

]

{ #category : #encoding }
SCCPConnectionConfirm >> writeOn: aMsg [
	aMsg putByte: SCCPHelper msgCc.
	SCCPAddrReference store: dst on: aMsg.
	SCCPAddrReference store: src on: aMsg.
	aMsg putByte: 2.
	aMsg putByte: 1.
	self pnc writeOn: aMsg

]

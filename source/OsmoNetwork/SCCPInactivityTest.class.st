"
I hold the data of an inactivity test.
"
Class {
	#name : #SCCPInactivityTest,
	#superclass : #SCCPMessage,
	#instVars : [
		'src',
		'dst',
		'proto',
		'seq',
		'credit'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #creation }
SCCPInactivityTest class >> initWithDst: aDst src: aSrc [
	^(self new)
	    dst: aDst;
	    src: aSrc;
	    yourself

]

{ #category : #field }
SCCPInactivityTest class >> msgType [
	^SCCPHelper msgIt

]

{ #category : #parsing }
SCCPInactivityTest class >> parseFrom: aByteArray [
	| dst src proto seq credit |
	dst := SCCPAddrReference 
		    fromByteArray: (aByteArray copyFrom: 2 to: aByteArray size).
	src := SCCPAddrReference 
		    fromByteArray: (aByteArray copyFrom: 5 to: aByteArray size).
	^(self initWithDst: dst src: src)
	    instVarNamed: #proto put: (aByteArray at: 8);
	    instVarNamed: #seq put: (aByteArray copyFrom: 9 to: 10);
	    instVarNamed: #credit put: (aByteArray at: 11);
	    yourself

]

{ #category : #stuff }
SCCPInactivityTest >> credit [
	^credit ifNil: [0]

]

{ #category : #stuff }
SCCPInactivityTest >> credit: aCredit [
	credit := aCredit

]

{ #category : #stuff }
SCCPInactivityTest >> dst [
	^dst

]

{ #category : #stuff }
SCCPInactivityTest >> dst: aDst [
	dst := aDst

]

{ #category : #stuff }
SCCPInactivityTest >> protoClass [
	^proto ifNil: [0]

]

{ #category : #stuff }
SCCPInactivityTest >> protoClass: aClass [
	proto := aClass

]

{ #category : #stuff }
SCCPInactivityTest >> seq [
	^seq ifNil: [ByteArray new: 2]

]

{ #category : #stuff }
SCCPInactivityTest >> seq: aSeq [
	seq := aSeq

]

{ #category : #stuff }
SCCPInactivityTest >> src [
	^src

]

{ #category : #stuff }
SCCPInactivityTest >> src: aSrc [
	src := aSrc

]

{ #category : #encoding }
SCCPInactivityTest >> writeOn: aMsg [
	aMsg putByte: self class msgType.
	SCCPAddrReference store: dst on: aMsg.
	SCCPAddrReference store: src on: aMsg.
	aMsg putByte: self protoClass.
	aMsg putByteArray: self seq.
	aMsg putByte: self credit

]

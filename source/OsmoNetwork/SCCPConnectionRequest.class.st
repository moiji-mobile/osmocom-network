"
I hold the data of a connection request.
"
Class {
	#name : #SCCPConnectionRequest,
	#superclass : #SCCPMessage,
	#instVars : [
		'src',
		'dst',
		'pnc'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #construction }
SCCPConnectionRequest class >> initWith: src dest: dest data: data [
	| pnc |
	pnc := SCCPPNC new.
	pnc at: SCCPHelper pncData put: data.
	^(self new)
	    src: src
		dest: dest
		pnc: pnc;
	    yourself

]

{ #category : #construction }
SCCPConnectionRequest class >> initWith: src dest: dest pnc: pnc [
	^(self new)
	    src: src
		dest: dest
		pnc: pnc;
	    yourself

]

{ #category : #factory }
SCCPConnectionRequest class >> msgType [
	^SCCPHelper msgCr

]

{ #category : #parsing }
SCCPConnectionRequest class >> parseFrom: aMsg [
	| src addr proto variable optional pnc |
	src := SCCPAddrReference fromByteArray: (aMsg copyFrom: 2 to: 4).
	proto := (aMsg at: 5) asInteger.
	variable := (aMsg at: 6) asInteger.
	optional := (aMsg at: 7) asInteger.

	"some sanity check"
	proto ~= 2 
	    ifTrue: [Exception signal: 'Proto should be two was ' , proto asString].

	"parse the address"
	addr := SCCPAddress parseFrom: (aMsg copyFrom: 6 + variable to: aMsg size).

	"parse the optional data"
	pnc := SCCPPNC parseFrom: (aMsg copyFrom: 7 + optional to: aMsg size).
	^SCCPConnectionRequest 
	    initWith: src
	    dest: addr
	    pnc: pnc

]

{ #category : #accessing }
SCCPConnectionRequest >> data [
	^pnc at: SCCPHelper pncData

]

{ #category : #accessing }
SCCPConnectionRequest >> data: aData [
	pnc at: SCCPHelper pncData put: aData

]

{ #category : #accessing }
SCCPConnectionRequest >> dest [
	^dst

]

{ #category : #accessing }
SCCPConnectionRequest >> src [
	^src

]

{ #category : #accessing }
SCCPConnectionRequest >> src: aSrc dest: aDest pnc: aPnc [
	src := aSrc.
	dst := aDest.
	pnc := aPnc

]

{ #category : #encoding }
SCCPConnectionRequest >> writeOn: aMsg [
	| dat len addr |
	addr := dst asByteArray.
	aMsg putByte: self class msgType.
	SCCPAddrReference store: src on: aMsg.
	"store proto_class, variable_called, optional_start"
	aMsg putByte: 2.
	aMsg putByte: 2.
	aMsg putByte: 1 + addr size.
	aMsg putByteArray: addr.

	"place the data now"
	pnc writeOn: aMsg.
	^aMsg

]

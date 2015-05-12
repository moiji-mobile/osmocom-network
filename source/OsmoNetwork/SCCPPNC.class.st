"
I can parse and write the optional
    data of SCCP messages.
"
Class {
	#name : #SCCPPNC,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #parsing }
SCCPPNC class >> parseFrom: aPnc [
	| dict pnc |
	pnc := aPnc.
	dict := Dictionary new.
	[pnc isEmpty not] whileTrue: 
		[| type |
		type := pnc at: 1.
		type = SCCPHelper pncEoO 
		    ifTrue: [pnc := ByteArray new]
		    ifFalse: 
			[| size data |
			size := pnc at: 2.
			data := pnc copyFrom: 3 to: 3 + size - 1.
			pnc := pnc copyFrom: 3 + size to: pnc size.
			dict at: type put: data]].
	^(self new)
	    dict: dict;
	    yourself

]

{ #category : #accessing }
SCCPPNC >> at: aKey [
	^self dict at: aKey

]

{ #category : #accessing }
SCCPPNC >> at: aKey put: aValue [
	self dict at: aKey put: aValue

]

{ #category : #accessing }
SCCPPNC >> dict [
	^dict ifNil: [dict := Dictionary new]

]

{ #category : #private }
SCCPPNC >> dict: aDict [
	dict := aDict

]

{ #category : #accessing }
SCCPPNC >> isEmpty [
	^self dict isEmpty
]

{ #category : #encoding }
SCCPPNC >> writeOn: aMsg [
	self dict keysAndValuesDo: 
		[:key :val | 
		| dat |
		dat := val toMessageOrByteArray.
		aMsg putByte: key.
		aMsg putByte: dat size.
		aMsg putByteArray: dat].
	aMsg putByte: SCCPHelper pncEoO

]

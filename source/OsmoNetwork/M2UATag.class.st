"
I represent a tag of a M2UA packet. I hold the
    number of the tag and the data associated with it.
"
Class {
	#name : #M2UATag,
	#superclass : #Object,
	#instVars : [
		'tag_nr',
		'data'
	],
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #parsing }
M2UATag class >> fromStream: aStream [
	^self new parseFrom: aStream

]

{ #category : #creation }
M2UATag class >> initWith: aTag data: aData [
	^(self new)
	    instVarNamed: #tag_nr put: aTag;
	    instVarNamed: #data put: aData;
	    yourself

]

{ #category : #accessing }
M2UATag >> data [
	^data ifNil: [data := ByteArray new]

]

{ #category : #accessing }
M2UATag >> isTag: aNr [
	^self nr = aNr

]

{ #category : #accessing }
M2UATag >> nr [
	^tag_nr

]

{ #category : #parsing }
M2UATag >> parseFrom: aStream [
	| len padding |
	tag_nr := ((aStream next: 2) shortAt: 1) swap16.
	len := ((aStream next: 2) shortAt: 1) swap16.
	data := aStream next: len - 4.
	padding := len \\ 4.
	padding > 0 
	    ifTrue: 
		[self logNotice: ('Going to skip <1p> bytes' expandMacrosWith: 4 - padding)
		    area: #m2ua.
		aStream skip: 4 - padding]

]

{ #category : #private }
M2UATag >> writeOn: aMsg [
	| rest |
	aMsg putLen16: tag_nr.
	aMsg putLen16: self data size + 4.
	aMsg putByteArray: self data.
	rest := self data size \\ 4.
	rest > 0 ifTrue: [aMsg putByteArray: (ByteArray new: 4 - rest)]

]

"
I represent the global title translation specific
    encoing of a SCCP header.
"
Class {
	#name : #SCCPGlobalTitleTranslation,
	#superclass : #SCCPGlobalTitle,
	#instVars : [
		'trans',
		'plan',
		'nature',
		'addr'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #creation }
SCCPGlobalTitleTranslation class >> initWith: data [
	| enc |
	enc := (data at: 2) bitAnd: 16r0F.
	^(self new)
	    translation: (data at: 1);
	    plan: (((data at: 2) bitAnd: 16rF0) bitShift: -4);
	    nature: ((data at: 3) bitAnd: 16r7F);
	    addr: (self parseAddr: (data copyFrom: 4 to: data size) encoding: enc);
	    yourself

]

{ #category : #constants }
SCCPGlobalTitleTranslation class >> subType [
	^4

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> addr [
	^self address

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> addr: anAddr [
	addr := anAddr

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> address [
	^addr

]

{ #category : #encoding }
SCCPGlobalTitleTranslation >> asByteArray [
	| data |
	data := OrderedCollection new.

	"write the header"
	data add: self translation.
	data add: ((plan bitShift: 4) bitOr: self encoding).
	data add: nature.

	"encode the number"
	SCCPGlobalTitle formatAddr: addr on: data.
	^data asByteArray

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> encoding [
	^addr size odd ifTrue: [1] ifFalse: [2]

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> nature [
	^nature

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> nature: aNai [
	nature := aNai

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> plan [
	^plan

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> plan: aPlan [
	plan := aPlan

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> translation [
	^trans ifNil: [0]

]

{ #category : #accessing }
SCCPGlobalTitleTranslation >> translation: aTrans [
	trans := aTrans

]

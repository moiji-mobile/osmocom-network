"
A network buffer/creation class. Modeled after the msgb of osmocore
"
Class {
	#name : #MessageBuffer,
	#superclass : #Collection,
	#instVars : [
		'chunks'
	],
	#category : #'OsmoNetwork-Message'
}

{ #category : #creation }
MessageBuffer class >> new [
	^(super new)
	    initialize;
	    yourself

]

{ #category : #accessing }
MessageBuffer >> do: aBlock [
	chunks do: [:chunk | chunk do: aBlock]

]

{ #category : #accessing }
MessageBuffer >> initialize [
	chunks := OrderedCollection new

]

{ #category : #'as yet unclassified' }
MessageBuffer >> nextPut: anInteger [ 
	^self putByte: anInteger
]

{ #category : #'as yet unclassified' }
MessageBuffer >> nextPutAll: aCollection [ 
	self putByteArray: aCollection
]

{ #category : #creation }
MessageBuffer >> prependByteArray: aByteArray [
	chunks addFirst: aByteArray

]

{ #category : #creation }
MessageBuffer >> put16: aInt [
	| data low high |
	low := aInt bitAnd: 16rFF.
	high := (aInt bitShift: -8) bitAnd: 16rFF.
	data := ByteArray with: low with: high.
	chunks add: data

]

{ #category : #creation }
MessageBuffer >> putByte: aByte [
	chunks add: (ByteArray with: aByte)

]

{ #category : #creation }
MessageBuffer >> putByteArray: aByteArray [
	chunks add: aByteArray

]

{ #category : #creation }
MessageBuffer >> putLen16: aInt [
	| data low high |
	low := (aInt bitShift: -8) bitAnd: 16rFF.
	high := aInt bitAnd: 16rFF.
	data := ByteArray with: low with: high.
	chunks add: data

]

{ #category : #creation }
MessageBuffer >> putLen32: aInt [
	| a b c d data |
	a := (aInt bitShift: -24) bitAnd: 16rFF.
	b := (aInt bitShift: -16) bitAnd: 16rFF.
	c := (aInt bitShift: -8) bitAnd: 16rFF.
	d := (aInt bitShift: 0) bitAnd: 16rFF.
	data := ByteArray 
		    with: a
		    with: b
		    with: c
		    with: d.
	chunks add: data

]

{ #category : #accessing }
MessageBuffer >> size [
	"Count of how much data we have collected"
	^chunks inject: 0 into: [:acc :each | acc + each size]

]

{ #category : #deprecated }
MessageBuffer >> toByteArray [
	^self asByteArray

]

{ #category : #creation }
MessageBuffer >> toMessage [
	^self

]

Class {
	#name : #MTPL3MockLayer3Boundary,
	#superclass : #Object,
	#instVars : [
		'on_data',
		'on_in_service',
		'sentData',
		'on_out_of_service'
	],
	#category : #'MTP3-LinkHandling-Tests'
}

{ #category : #'Q.704' }
MTPL3MockLayer3Boundary >> connect [
	"Nothing here..."
]

{ #category : #testing }
MTPL3MockLayer3Boundary >> data: aBuffer index: anIndex [
	self sentData add: (aBuffer asByteArray -> anIndex).
]

{ #category : #stub }
MTPL3MockLayer3Boundary >> disconnect [
	"Nothing todo"
]

{ #category : #testing }
MTPL3MockLayer3Boundary >> onData: aBlock [
	on_data := aBlock.
]

{ #category : #testing }
MTPL3MockLayer3Boundary >> onInService: aBlock [
	on_in_service := aBlock
]

{ #category : #stub }
MTPL3MockLayer3Boundary >> onOutOfService: aBlock [
	on_out_of_service := aBlock
]

{ #category : #testing }
MTPL3MockLayer3Boundary >> sentData [
	^sentData ifNil: [ sentData := OrderedCollection new ]
]

{ #category : #stub }
MTPL3MockLayer3Boundary >> stop [
	"Nothing here.."
]

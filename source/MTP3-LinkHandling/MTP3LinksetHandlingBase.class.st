Class {
	#name : #MTP3LinksetHandlingBase,
	#superclass : #Object,
	#instVars : [
		'linkSet'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #creation }
MTP3LinksetHandlingBase class >> initWith: aLinkSet [
	^self new
		initialize;
		linkSet: aLinkSet;
		yourself
]

{ #category : #creation }
MTP3LinksetHandlingBase >> initialize [
	super initialize
]

{ #category : #creation }
MTP3LinksetHandlingBase >> linkSet: aLinkSet [
	linkSet := aLinkSet
]

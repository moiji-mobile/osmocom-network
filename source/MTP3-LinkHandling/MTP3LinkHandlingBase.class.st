Class {
	#name : #MTP3LinkHandlingBase,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #creation }
MTP3LinkHandlingBase class >> initWith: aLink [
	^self new
		link: aLink;
		yourself
]

{ #category : #'as yet unclassified' }
MTP3LinkHandlingBase >> hmrt [
	^link linkSet mtp3Service hmrt
]

{ #category : #creation }
MTP3LinkHandlingBase >> initialize [
	super initialize
]

{ #category : #private }
MTP3LinkHandlingBase >> link [
	^link
]

{ #category : #creation }
MTP3LinkHandlingBase >> link: aLink [
	link := aLink.
]

{ #category : #private }
MTP3LinkHandlingBase >> linkSet [
	^self link linkSet
]

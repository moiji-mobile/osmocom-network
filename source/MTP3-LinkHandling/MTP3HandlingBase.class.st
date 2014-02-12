Class {
	#name : #MTP3HandlingBase,
	#superclass : #Object,
	#instVars : [
		'mtp3Service'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #creation }
MTP3HandlingBase class >> initWith: aService [
	^self new
		initialize;
		mtp3Service: aService ;
		yourself
]

{ #category : #creation }
MTP3HandlingBase >> mtp3Service: aService [
	mtp3Service := aService
]

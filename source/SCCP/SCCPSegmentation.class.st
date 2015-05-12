Class {
	#name : #SCCPSegmentation,
	#superclass : #Object,
	#instVars : [
		'firstSegment',
		'segmentClass',
		'remainingSegments',
		'sourceReference'
	],
	#category : #SCCP
}

{ #category : #'as yet unclassified' }
SCCPSegmentation class >> readFrom: aStream [
	| res data |
	res := self new.
	data := aStream next.
	^res
		firstSegment: (data bitAnd: 2r1000000) > 0;
		segmentClass:  ((data bitAnd: 2r01000000) bitShift: -7);
		remainingSegments: (data bitAnd: 2r1111);
		sourceReference: aStream upToEnd;
		yourself
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> firstSegment [
	^ firstSegment
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> firstSegment: aBoolean [
	firstSegment := aBoolean
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> remainingSegments [
	^ remainingSegments
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> remainingSegments: anInteger [ 
	remainingSegments := anInteger
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> segmentClass: anInteger [ 
	segmentClass := anInteger
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> sourceReference [
	^ sourceReference
]

{ #category : #'as yet unclassified' }
SCCPSegmentation >> sourceReference: aReference [
	sourceReference := aReference
]

Class {
	#name : #MTP3BaseMSG,
	#superclass : #Object,
	#instVars : [
		'service',
		'label'
	],
	#category : #'MTP3-Codec'
}

{ #category : #accessing }
MTP3BaseMSG >> label [
	^label
]

{ #category : #creation }
MTP3BaseMSG >> label: aLabel [
	label := aLabel

]

{ #category : #accessing }
MTP3BaseMSG >> service [
	^service
]

{ #category : #creation }
MTP3BaseMSG >> service: aService [
	service := aService

]

{ #category : #encoding }
MTP3BaseMSG >> writeOn: aBuffer [
	service writeOn: aBuffer.
	label writeOn: aBuffer.

]

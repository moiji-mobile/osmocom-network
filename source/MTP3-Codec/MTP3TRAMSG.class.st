Class {
	#name : #MTP3TRAMSG,
	#superclass : #MTP3TRMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3TRAMSG class >> h1 [
	^self h1TRA

]

{ #category : #'as yet unclassified' }
MTP3TRAMSG class >> humanName [
	^'Traffic-restart-allowed signal'

]

{ #category : #'as yet unclassified' }
MTP3TRAMSG >> parseFrom: aStream [
	"Nothing"
]

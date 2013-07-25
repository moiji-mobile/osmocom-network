Class {
	#name : #MTP3ECAMSG,
	#superclass : #MTP3ECMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3ECAMSG class >> h1 [
	^self h1ECA

]

{ #category : #'as yet unclassified' }
MTP3ECAMSG class >> humanName [
	^'Emergency-changeover-acknowledgement signal'

]

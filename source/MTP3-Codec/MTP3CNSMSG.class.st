Class {
	#name : #MTP3CNSMSG,
	#superclass : #MTP3DLMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3CNSMSG class >> h1 [
	^self h1CNS

]

{ #category : #'as yet unclassified' }
MTP3CNSMSG class >> humanName [
	^'Connection-not-successful signal'

]

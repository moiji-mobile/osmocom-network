Class {
	#name : #MTP3CNPMSG,
	#superclass : #MTP3DLMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3CNPMSG class >> h1 [
	^self h1CNP

]

{ #category : #'as yet unclassified' }
MTP3CNPMSG class >> humanName [
	^'Connection-not-possible signal'

]

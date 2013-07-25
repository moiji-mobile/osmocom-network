Class {
	#name : #MTP3TFPMSG,
	#superclass : #MTP3TFMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3TFPMSG class >> h1 [
	^self h1TFP

]

{ #category : #'as yet unclassified' }
MTP3TFPMSG class >> humanName [
	^'Transfer-prohibited signal'

]

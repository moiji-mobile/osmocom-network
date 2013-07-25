Class {
	#name : #MTP3LinkTestTimer,
	#superclass : #Object,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3LinkTestTimer >> T1 [
	"Supervision timer for signalling link test
	 acknowledgement message. Equal or greater than T6 of Q.703"

	^4 * 1000 to: 12 * 1000

]

{ #category : #'as yet unclassified' }
MTP3LinkTestTimer >> T2 [
	"Interval timer for sending signalling link
	 test messages"

	^30 * 1000 to: 90 * 1000

]

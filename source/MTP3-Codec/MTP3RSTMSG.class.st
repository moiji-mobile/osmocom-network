Class {
	#name : #MTP3RSTMSG,
	#superclass : #MTP3RSMMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3RSTMSG class >> h1 [
	^self h1RST

]

{ #category : #'as yet unclassified' }
MTP3RSTMSG class >> humanName [
	^'Signalling-route-set-test signal for prohibited destination'

]

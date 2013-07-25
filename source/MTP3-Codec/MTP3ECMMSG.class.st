"
ECM message base class
"
Class {
	#name : #MTP3ECMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3ECMMSG class >> h0 [
	^self h0Ecm

]

{ #category : #'as yet unclassified' }
MTP3ECMMSG class >> humanName [
	^'Emergency-changeover message'

]

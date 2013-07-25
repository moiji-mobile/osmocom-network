"
RSM message base class
"
Class {
	#name : #MTP3RSMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3RSMMSG class >> h0 [
	^self h0Rsm

]

{ #category : #'as yet unclassified' }
MTP3RSMMSG class >> humanName [
	^'Signalling-route-set-test message'

]

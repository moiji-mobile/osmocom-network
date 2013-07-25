"
DLM message base class
"
Class {
	#name : #MTP3DLMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3DLMMSG class >> h0 [
	^self h0Dlm

]

{ #category : #'as yet unclassified' }
MTP3DLMMSG class >> humanName [
	^'Signalling-data-link-connection-order message'

]

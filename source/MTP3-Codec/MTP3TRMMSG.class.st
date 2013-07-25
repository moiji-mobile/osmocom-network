"
TRM message base class
"
Class {
	#name : #MTP3TRMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3TRMMSG class >> h0 [
	^self h0Trm

]

{ #category : #'as yet unclassified' }
MTP3TRMMSG class >> humanName [
	^'Traffic-restart-allowed message'

]

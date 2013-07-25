"
TFM message base class
"
Class {
	#name : #MTP3TFMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3TFMMSG class >> h0 [
	^self h0Tfm

]

{ #category : #'as yet unclassified' }
MTP3TFMMSG class >> humanName [
	^'Transfer-prohibited-transfer-allowed-transfer-restricted messages'

]

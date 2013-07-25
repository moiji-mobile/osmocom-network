"
UFC message base class
"
Class {
	#name : #MTP3UFCMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3UFCMSG class >> h0 [
	^self h0Ufc

]

{ #category : #'as yet unclassified' }
MTP3UFCMSG class >> humanName [
	^'User part flow control messages'

]

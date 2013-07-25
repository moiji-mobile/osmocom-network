"
FCM message base class
"
Class {
	#name : #MTP3FCMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3FCMMSG class >> h0 [
	^self h0Fcm

]

{ #category : #'as yet unclassified' }
MTP3FCMMSG class >> humanName [
	^'Signalling-traffic-flow-control messages'

]

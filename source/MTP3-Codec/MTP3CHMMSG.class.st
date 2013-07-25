"
CHM message base class
"
Class {
	#name : #MTP3CHMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3CHMMSG class >> h0 [
	^self h0Chm

]

{ #category : #'as yet unclassified' }
MTP3CHMMSG class >> humanName [
	^'Changeover and changeback messages'

]

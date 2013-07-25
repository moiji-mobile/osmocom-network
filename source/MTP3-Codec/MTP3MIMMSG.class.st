"
MIM message base class
"
Class {
	#name : #MTP3MIMMSG,
	#superclass : #MTP3NetworkManagementMSG,
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3MIMMSG class >> h0 [
	^self h0Mim

]

{ #category : #'as yet unclassified' }
MTP3MIMMSG class >> humanName [
	^'Management inhibit messages'

]

Class {
	#name : #M2UAMAUPDataRetrievalConfirm,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPDataRetrievalConfirm class >> messageTag [
	^M2UAConstants maupDRetrCon

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPDataRetrievalConfirm >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleRetrievalConfirm: self.

]

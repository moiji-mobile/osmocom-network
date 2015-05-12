Class {
	#name : #M2UAMAUPDataRetrievalRequest,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPDataRetrievalRequest class >> messageTag [
	^M2UAConstants maupDRetrReq

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPDataRetrievalRequest >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleRetrievalRequest: self.

]

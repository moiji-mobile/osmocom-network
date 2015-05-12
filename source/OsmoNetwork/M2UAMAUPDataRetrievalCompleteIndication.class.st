Class {
	#name : #M2UAMAUPDataRetrievalCompleteIndication,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPDataRetrievalCompleteIndication class >> messageTag [
	^M2UAConstants maupDRetrCompl
]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPDataRetrievalCompleteIndication >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleRetrievalComplete: self.

]

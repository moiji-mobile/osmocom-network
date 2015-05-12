Class {
	#name : #M2UAMAUPDataRetrievalIndication,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPDataRetrievalIndication class >> messageTag [
	^M2UAConstants maupDRetrInd 

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPDataRetrievalIndication >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleRetrievalIndication: self.

]

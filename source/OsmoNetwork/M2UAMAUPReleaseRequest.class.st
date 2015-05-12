Class {
	#name : #M2UAMAUPReleaseRequest,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPReleaseRequest class >> messageTag [
	^M2UAConstants maupRelReq

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPReleaseRequest >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleReleaseRequest: self.

]

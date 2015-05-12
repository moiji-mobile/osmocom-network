Class {
	#name : #M2UAMAUPStateRequest,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPStateRequest class >> messageTag [
	^M2UAConstants maupStateReq
]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPStateRequest >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleStateRequest: self.

]

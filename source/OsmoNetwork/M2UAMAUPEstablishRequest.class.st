Class {
	#name : #M2UAMAUPEstablishRequest,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPEstablishRequest class >> messageTag [
	^M2UAConstants maupEstReq

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPEstablishRequest >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleEstablishRequest: self.

]

Class {
	#name : #M2UAMAUPEstablishConfirm,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPEstablishConfirm class >> messageTag [
	^M2UAConstants maupEstCon

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPEstablishConfirm >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleEstablishConfirm: self.

]

Class {
	#name : #M2UAMAUPStateConfirm,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPStateConfirm class >> messageTag [
	^M2UAConstants maupStateCon
]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPStateConfirm >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleStateConfirm: self.

]

Class {
	#name : #M2UAMAUPReleaseConfirm,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPReleaseConfirm class >> messageTag [
	^M2UAConstants maupRelCon

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPReleaseConfirm >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleReleaseConfirm: self.

]

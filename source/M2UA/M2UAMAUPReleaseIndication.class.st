Class {
	#name : #M2UAMAUPReleaseIndication,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPReleaseIndication class >> messageTag [
	^M2UAConstants maupRelInd

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPReleaseIndication >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleReleaseIndication: self.

]

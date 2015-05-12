Class {
	#name : #M2UAMAUPStateIndication,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPStateIndication class >> messageTag [
	^M2UAConstants maupStateInd
]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPStateIndication >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleStateIndication: self.

]

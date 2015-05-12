Class {
	#name : #M2UAMAUPData,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPData class >> messageTag [
	^M2UAConstants maupData

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPData >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleData: self.

]

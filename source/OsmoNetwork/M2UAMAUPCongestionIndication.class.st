Class {
	#name : #M2UAMAUPCongestionIndication,
	#superclass : #M2UAMAUPMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAMAUPCongestionIndication class >> messageTag [
	^M2UAConstants maupCongInd

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPCongestionIndication >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleCongestionIndication: self.

]

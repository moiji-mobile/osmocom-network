Class {
	#name : #M2UAMAUPDataAcknowledge,
	#superclass : #M2UAMAUPMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAMAUPDataAcknowledge class >> messageTag [
	^M2UAConstants maupDataAck

]

{ #category : #'m2ua-asp-dispatch' }
M2UAMAUPDataAcknowledge >> dispatchOnAsp: anAsp [
	anAsp mtpLevel3Boundary handleDataAck: self.

]

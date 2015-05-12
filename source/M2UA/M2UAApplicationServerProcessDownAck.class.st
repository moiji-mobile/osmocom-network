Class {
	#name : #M2UAApplicationServerProcessDownAck,
	#superclass : #M2UAASPSMMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessDownAck class >> messageTag [
	^M2UAConstants aspsmDownAck

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessDownAck >> dispatchOnAsp: anAsp [
	anAsp handleAspDownAck: self

]

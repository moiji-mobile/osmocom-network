Class {
	#name : #M2UAApplicationServerProcessInactiveAck,
	#superclass : #M2UAASPTMMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessInactiveAck class >> messageTag [
	^M2UAConstants asptmInactivAck

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessInactiveAck >> dispatchOnAsp: anAsp [
	anAsp handleAspInactiveAck: self

]

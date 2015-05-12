Class {
	#name : #M2UAApplicationServerProcessUpAck,
	#superclass : #M2UAASPSMMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessUpAck class >> messageTag [
	^M2UAConstants aspsmUpAck

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessUpAck >> dispatchOnAsp: anAsp [
	anAsp handleAspUpAck: self

]

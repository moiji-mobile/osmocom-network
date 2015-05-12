Class {
	#name : #M2UAApplicationServerProcessActiveAck,
	#superclass : #M2UAASPTMMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessActiveAck class >> messageTag [
	^M2UAConstants asptmActivAck

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessActiveAck >> dispatchOnAsp: anAsp [
	anAsp handleAspActiveAck: self

]

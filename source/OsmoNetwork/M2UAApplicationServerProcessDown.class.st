Class {
	#name : #M2UAApplicationServerProcessDown,
	#superclass : #M2UAASPSMMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessDown class >> messageTag [
	^M2UAConstants aspsmDown

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessDown >> dispatchOnAsp: anAsp [
	anAsp handleAspDown: self

]

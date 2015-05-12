Class {
	#name : #M2UAApplicationServerProcessUp,
	#superclass : #M2UAASPSMMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessUp class >> messageTag [
	^M2UAConstants aspsmUp

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessUp >> dispatchOnAsp: anAsp [
	anAsp handleAspUp: self

]

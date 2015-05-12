Class {
	#name : #M2UAApplicationServerProcessActive,
	#superclass : #M2UAASPTMMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessActive class >> messageTag [
	^M2UAConstants asptmActiv

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessActive >> dispatchOnAsp: anAsp [
	anAsp handleAspActive: self

]

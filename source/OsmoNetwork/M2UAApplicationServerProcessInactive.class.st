Class {
	#name : #M2UAApplicationServerProcessInactive,
	#superclass : #M2UAASPTMMessage,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessInactive class >> messageTag [
	^M2UAConstants asptmInactiv

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessInactive >> dispatchOnAsp: anAsp [
	anAsp handleAspInactive: self

]

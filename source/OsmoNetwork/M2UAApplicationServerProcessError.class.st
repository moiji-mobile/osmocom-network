Class {
	#name : #M2UAApplicationServerProcessError,
	#superclass : #M2UAASPMGMTMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessError class >> messageTag [
	^M2UAConstants mgmtError

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessError >> dispatchOnAsp: anAsp [
	anAsp handleError: self

]

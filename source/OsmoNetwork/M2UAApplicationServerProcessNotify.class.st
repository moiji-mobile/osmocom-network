Class {
	#name : #M2UAApplicationServerProcessNotify,
	#superclass : #M2UAASPMGMTMessage,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessNotify class >> messageTag [
	^M2UAConstants mgmtNtfy

]

{ #category : #'m2ua-asp-dispatch' }
M2UAApplicationServerProcessNotify >> dispatchOnAsp: anAsp [
	anAsp handleNotify: self

]

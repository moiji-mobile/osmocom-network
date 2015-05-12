Class {
	#name : #M2UAAsStateInactive,
	#superclass : #M2UAAsState,
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'state-changes' }
M2UAAsStateInactive >> onAllAspDown: anEvent [
	"All ASP trans to ASP-DOWN"
	self moveToState: M2UAAsStateDown

]

{ #category : #'state-changes' }
M2UAAsStateInactive >> onAspActive: anEvent [
	"one ASP trans to ACTIVE"
	self moveToState: M2UAAsStateActive

]

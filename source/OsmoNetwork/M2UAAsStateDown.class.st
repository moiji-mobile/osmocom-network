Class {
	#name : #M2UAAsStateDown,
	#superclass : #M2UAAsState,
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'state-changes' }
M2UAAsStateDown >> onAspInactive: anEvent [
	"One ASP trans to ASP-INACTIVE"
	self movesToState: M2UAAsStateInactive

]

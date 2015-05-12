Class {
	#name : #M2UAAsStatePending,
	#superclass : #M2UAAsState,
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'state-change' }
M2UAAsStatePending >> onAspUp: anEvent [
	"One ASP trans to ASP-ACTIVE"
	self stopTr.
	self moveToState: M2UAAsStateActive

]

{ #category : #'state-change' }
M2UAAsStatePending >> onTrExpiry [
	"Tr Expiry, at least one ASP in ASP-INACTIVE -> AS-INACTIVE"

	"Tr Expiry and no ASPin ASP-INACTIVE state"
	self hasInactiveAsp 
	    ifTrue: [self moveToState: M2UAAsStateInactive]
	    ifFalse: [self moveToState: M2UAAsStateDown]

]

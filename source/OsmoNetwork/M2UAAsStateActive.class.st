Class {
	#name : #M2UAAsStateActive,
	#superclass : #M2UAAsState,
	#category : #'M2UA-States'
}

{ #category : #'state-changes' }
M2UAAsStateActive >> onLastActiveAspDown: anEvent [
	"Last ACTIVEASP trans to ASP-INACTIVE or ASP-Down"
	self startTr.
	self moveToState: M2UAAsStatePending

]

"
I am the base class of the ASP State Machine from RFC 3331 on Page 61.
"
Class {
	#name : #M2UAAspState,
	#superclass : #M2UAStateBase,
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAAspState class >> nextPossibleStates [
	^self subclassResponsibility

]

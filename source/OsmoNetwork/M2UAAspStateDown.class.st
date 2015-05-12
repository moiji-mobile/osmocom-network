Class {
	#name : #M2UAAspStateDown,
	#superclass : #M2UAAspState,
	#category : #'M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAAspStateDown class >> nextPossibleStates [
	^{M2UAAspStateInactive}

]

{ #category : #'state-changes' }
M2UAAspStateDown >> onAspUp: anEvent [
	^self moveToState: M2UAAspStateInactive

]

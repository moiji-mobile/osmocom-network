Class {
	#name : #M2UAAspStateInactive,
	#superclass : #M2UAAspState,
	#category : #'M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAAspStateInactive class >> nextPossibleStates [
	^
	{M2UAAspStateActive.
	M2UAAspStateDown}

]

{ #category : #'state-changes' }
M2UAAspStateInactive >> onAspActive: anEvent [
	^self moveToState: M2UAAspStateActive

]

{ #category : #'state-changes' }
M2UAAspStateInactive >> onAspDown: anEvent [
	^self moveToState: M2UAAspStateDown

]

{ #category : #'state-changes' }
M2UAAspStateInactive >> onSctpCdi: anEvent [
	^self moveToState: M2UAAspStateDown

]

{ #category : #'state-changes' }
M2UAAspStateInactive >> onSctpRi: anEvent [
	^self moveToState: M2UAAspStateDown

]

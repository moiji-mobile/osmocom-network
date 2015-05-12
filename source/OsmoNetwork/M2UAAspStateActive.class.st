Class {
	#name : #M2UAAspStateActive,
	#superclass : #M2UAAspState,
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAAspStateActive class >> nextPossibleStates [
	^
	{M2UAAspStateInactive.
	M2UAAspStateDown}

]

{ #category : #'state-changes' }
M2UAAspStateActive >> onAspDown: anEvent [
	self moveToState: M2UAAspStateDown

]

{ #category : #'state-changes' }
M2UAAspStateActive >> onAspInactive: anEvent [
	^self moveToState: M2UAAspStateInactive

]

{ #category : #'state-changes' }
M2UAAspStateActive >> onOtherAspInAsOverrides: anEvent [
	^self moveToState: M2UAAspStateInactive

]

{ #category : #'state-changes' }
M2UAAspStateActive >> onSctpCdi: anEvent [
	self moveToState: M2UAAspStateDown

]

{ #category : #'state-changes' }
M2UAAspStateActive >> onSctpRi: anEvent [
	^self moveToState: M2UAAspStateDown

]

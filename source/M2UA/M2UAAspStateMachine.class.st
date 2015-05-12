"
I am the Application Server Process State machine. An
pplication Server Process will create me to manage the state. My state
machine is driven by calling the selectors from the events protocol.
If you ask for an illegal state transition a DNU will be raised. Ath
this point you should probably reset what you are doing and do proper
error reporting.

This class is currently not used!
"
Class {
	#name : #M2UAAspStateMachine,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAAspStateMachine class >> initialState [
	^M2UAAspStateDown

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine class >> new [
	^(self basicNew)
	    initialize;
	    yourself

]

{ #category : #events }
M2UAAspStateMachine >> aspActive: anEvent [
	state onAspActive: anEvent

]

{ #category : #events }
M2UAAspStateMachine >> aspDown: anEvent [
	state onAspDown: anEvent

]

{ #category : #events }
M2UAAspStateMachine >> aspInactive: anEvent [
	state onAspInactive: anEvent

]

{ #category : #events }
M2UAAspStateMachine >> aspUp: anEvent [
	state onAspUp: anEvent

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine >> entered: aState [
	aState entered

	"TODO notify users of the machine"

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine >> initialize [
	state := self class initialState on: self

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine >> left: aState [
	aState left

	"TODO notify users of the machine"

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine >> moveToState: aNewState [
	| oldState |
	oldState := state.
	state := (aNewState new)
		    machine: self;
		    yourself.
	self left: oldState.
	self entered: state

]

{ #category : #events }
M2UAAspStateMachine >> otherAspInAsOverrides: anEvent [
	state onOtherAspInAsOverrides: anEvent

]

{ #category : #events }
M2UAAspStateMachine >> sctpCdi: anEvent [
	state onSctpCdi: anEvent

]

{ #category : #events }
M2UAAspStateMachine >> sctpRi: anEvent [
	state onSctpRi: anEvent

]

{ #category : #'as yet unclassified' }
M2UAAspStateMachine >> state [
	^state class

]

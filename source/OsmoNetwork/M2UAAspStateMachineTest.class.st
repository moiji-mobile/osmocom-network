"
A M2UAAspStateMachineTest is a test class for testing the behavior of M2UAAspStateMachine
"
Class {
	#name : #M2UAAspStateMachineTest,
	#superclass : #TestCase,
	#category : #'M2UA-Tests'
}

{ #category : #'as yet unclassified' }
M2UAAspStateMachineTest >> testLegalTransitions [
	| machine |
	machine := M2UAAspStateMachine new.
	self assert: machine state = M2UAAspStateDown.
	machine aspUp: 'Link is up'.
	self assert: machine state = M2UAAspStateInactive.
	machine aspActive: 'Active'.
	self assert: machine state = M2UAAspStateActive.
	machine aspInactive: 'Inactive'.
	self assert: machine state = M2UAAspStateInactive.
	machine aspActive: 'Active'.
	self assert: machine state = M2UAAspStateActive.
	machine sctpCdi: 'Connection is gone'.
	self assert: machine state = M2UAAspStateDown

]

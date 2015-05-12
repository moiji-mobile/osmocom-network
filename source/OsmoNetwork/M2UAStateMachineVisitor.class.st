"
I can read the compiled methods of a M2UA state machine and generate graphviz code about the state machine and transitions that occur in it. They can be rendered by invoking the dot program on the string.
"
Class {
	#name : #M2UAStateMachineVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'states'
	],
	#category : #'OsmoNetwork-M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAStateMachineVisitor >> acceptMessageNode: aNode [
	aNode selector = #moveToState: 
	    ifTrue: [self addTransition: aNode arguments first name asString].
	super acceptMessageNode: aNode

]

{ #category : #states }
M2UAStateMachineVisitor >> addTransition: aStateName [
	self stateSet add: aStateName

]

{ #category : #states }
M2UAStateMachineVisitor >> stateSet [
	^states ifNil: [states := Set new]

]

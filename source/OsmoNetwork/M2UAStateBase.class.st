"
I am the base class of all M2UA state machines. My direct subclasses are state machines and their subclasses are the individual states that make up the statemachine.
"
Class {
	#name : #M2UAStateBase,
	#superclass : #Object,
	#instVars : [
		'machine'
	],
	#category : #'M2UA-States'
}

{ #category : #'as yet unclassified' }
M2UAStateBase class >> addStateFrom: aMethod to: newState class: aClass on: aStream [
	aStream
	    nextPutAll: aClass name asString;
	    nextPutAll: ' -> ';
	    nextPutAll: newState;
	    nextPutAll: ' [ label = "';
	    nextPutAll: aMethod asString allButLast;
	    nextPutAll: '"];';
	    cr;
	    lf

]

{ #category : #'as yet unclassified' }
M2UAStateBase class >> generateGraphviz [
	| stream |
	stream := WriteStream on: String new.
	stream
	    nextPutAll: 'digraph {';
	    cr;
	    lf.
	self subclassesDo: 
		[:class | 
		class selectors do: 
			[:selector | 
			| codeVisitor method |
			method := class >> selector.
			codeVisitor := (RBParser parseMethod: method sourceCode) body 
				    acceptVisitor: M2UAStateMachineVisitor new.
			codeVisitor stateSet do: 
				[:newState | 
				self 
				    addStateFrom: method selector asString
				    to: newState
				    class: class
				    on: stream]]].
	^stream
	    nextPutAll: '}';
	    contents

]

{ #category : #'as yet unclassified' }
M2UAStateBase class >> on: aMachine [
	"Create a new state for a machine"

	^(self new)
	    machine: aMachine;
	    yourself

]

{ #category : #'as yet unclassified' }
M2UAStateBase >> entered [
	"The state has been entered"

]

{ #category : #'as yet unclassified' }
M2UAStateBase >> left [
	"The state has been left"

]

{ #category : #'as yet unclassified' }
M2UAStateBase >> machine: aMachine [
	machine := aMachine

]

{ #category : #transition }
M2UAStateBase >> moveToState: aNewState [
	machine moveToState: aNewState

]

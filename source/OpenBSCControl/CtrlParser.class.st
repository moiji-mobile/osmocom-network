"
I parse the tokens from the Ctrl grammar
"
Class {
	#name : #CtrlParser,
	#superclass : #CtrlGrammar,
	#category : #OpenBSCControl
}

{ #category : #'as yet unclassified' }
CtrlParser >> notSupported [
	^super notSupported ==> [:nodes | CtrlCmd with: (String withAll: nodes)]

]

{ #category : #'as yet unclassified' }
CtrlParser >> trapMessage [
	^super trapMessage ==> [:nodes | CtrlTrap findTrapFor: nodes]

]

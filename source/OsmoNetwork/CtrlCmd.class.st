"
I am a base class without any functions
"
Class {
	#name : #CtrlCmd,
	#superclass : #Object,
	#instVars : [
		'msg'
	],
	#category : #'OsmoNetwork-Control'
}

{ #category : #creation }
CtrlCmd class >> with: aMsg [
	^(self new)
	    instVarNamed: #msg put: aMsg;
	    yourself

]

{ #category : #accessing }
CtrlCmd >> isTrap [
	^false

]

{ #category : #accesing }
CtrlCmd >> msg [
	^msg

]

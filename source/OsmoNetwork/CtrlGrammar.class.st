"
I can parse the control interface
"
Class {
	#name : #CtrlGrammar,
	#superclass : #PPCompositeParser,
	#category : #'OsmoNetwork-Control'
}

{ #category : #identifier }
CtrlGrammar >> identifier [
	^#digit asParser plus flatten

]

{ #category : #message }
CtrlGrammar >> message [
	^self trapMessage / self notSupported

]

{ #category : #'not-supported' }
CtrlGrammar >> notSupported [
	^#any asParser plus

]

{ #category : #grammar }
CtrlGrammar >> start [
	^self message

]

{ #category : #trap }
CtrlGrammar >> trapMessage [
	^'TRAP' asParser trim , self identifier trim , self variable trim 
	    , #any asParser plus flatten

]

{ #category : #variable }
CtrlGrammar >> variable [
	^self variablePart plus

]

{ #category : #variable }
CtrlGrammar >> variablePart [
	^(#digit asParser plus / #letter asParser / $- asParser / $_ asParser) 
	    plus flatten 
	    , $. asParser optional

]

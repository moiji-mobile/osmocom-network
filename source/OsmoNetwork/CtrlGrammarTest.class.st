"
I test some parts of the grammar
"
Class {
	#name : #CtrlGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #'OsmoNetwork-Control-Tests'
}

{ #category : #accessing }
CtrlGrammarTest class >> packageNamesUnderTest [
	^#('CtrlGrammar')

]

{ #category : #accessing }
CtrlGrammarTest >> parserClass [
	^CtrlGrammar

]

{ #category : #accessing }
CtrlGrammarTest >> testLocationStateTrap [
	| data res |
	data := 'TRAP 0 net.0.bsc.7.bts.0.location-state 1,fix2d,4.860000,53.941111,0.000000,inoperational,unlocked,on'.
	res := self parse: data

]

Class {
	#name : #IPATests,
	#superclass : #TestCase,
	#instVars : [
		'called'
	],
	#category : #'IPA-Tests'
}

{ #category : #accessing }
IPATests class >> packageNamesUnderTest [
	^#('OsmoNetwork')

]

{ #category : #'dispatch-test' }
IPATests >> dispatchcallback: aData [
	called := aData = 'data'

]

{ #category : #'dispatch-test' }
IPATests >> testDispatch [
	| dispatch |
	called := false.
	dispatch := (IPADispatcher new)
		    addHandler: 16r23
			on: self
			with: #dispatchcallback:;
		    yourself.
	dispatch dispatch: 16r23 with: 'data'.
	self assert: called.
	called := false.
	dispatch
	    addHandler: 16r42 on: [:msg | called := msg = 'data'];
	    dispatch: 16r42 with: 'data'.
	self assert: called

]

{ #category : #'as yet unclassified' }
IPATests >> testMux [
	| data mux |
	mux := IPAMuxer new.
	data := 
		{
		{mux prepareNext: #(1 2 3) with: IPAConstants protocolOML.
		#(0 3 255 1 2 3) asByteArray}.
		
		{mux prepareNext: #(1 2 3) with: IPAConstants protocolOsmoMGCP.
		#(0 4 238 1 1 2 3) asByteArray}}.
	data do: [:each | self assert: each first = each second]

]

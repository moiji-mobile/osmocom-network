"
I am a hub and one can register handlers for the streams
"
Class {
	#name : #IPADispatcher,
	#superclass : #Object,
	#instVars : [
		'handlers'
	],
	#category : #IPA
}

{ #category : #creation }
IPADispatcher class >> new [
	^(super new)
	    initialize;
	    yourself

]

{ #category : #handler }
IPADispatcher >> addHandler: aStream on: aBlock [
	handlers at: aStream put: aBlock

]

{ #category : #handler }
IPADispatcher >> addHandler: aStream on: anObject with: aSelector [
	handlers at: aStream put: [:msg | anObject perform: aSelector with: msg]

]

{ #category : #handler }
IPADispatcher >> dispatch: aStream with: aData [
	| handler |
	handler := handlers at: aStream
		    ifAbsent: 
			[self logError: ('IPADispatcher has no registered handler for <1p>' 
				    expandMacrosWith: aStream)
			    area: #ipa.
			^false].
	handler value: aData

]

{ #category : #private }
IPADispatcher >> initialize [
	handlers := Dictionary new

]

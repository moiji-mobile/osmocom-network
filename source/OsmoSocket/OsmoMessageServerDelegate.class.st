Class {
	#name : #OsmoMessageServerDelegate,
	#superclass : #Object,
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageServerDelegate >> newDelegateClass [
	^OsmoMessageReadDelegate new
]

{ #category : #'as yet unclassified' }
OsmoMessageServerDelegate >> onNewConnection: aConnection [
	| readDelegate |
	"Need to register a readDelegate on the connection"
	readDelegate := self newDelegateClass.
	readDelegate onNewConnection: aConnection.
	aConnection readDelegate: readDelegate.
	
]

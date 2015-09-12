"
This is using the OsmoMessageSocketDirect which means a write will be serialized and block.
"
Class {
	#name : #OsmoMessageDirectConnection,
	#superclass : #OsmoMessageConnection,
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageDirectConnection class >> osmoMessageSocket [
	^OsmoMessageSocketDirect
]

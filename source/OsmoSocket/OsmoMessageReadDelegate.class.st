Class {
	#name : #OsmoMessageReadDelegate,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageReadDelegate >> connection [
	^connection
]

{ #category : #'as yet unclassified' }
OsmoMessageReadDelegate >> onNewConnection: aSocket [
	"Initialize"
	connection := aSocket
]

{ #category : #'as yet unclassified' }
OsmoMessageReadDelegate >> readOneMessage: aSocket [
	aSocket next
]

Class {
	#name : #OsmoUDPDatagram,
	#superclass : #Object,
	#instVars : [
		'port',
		'address',
		'data'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoUDPDatagram class >> data: aString address: anAddress port: aPort [ 
	^self new
		data: aString;
		address: anAddress;
		port: aPort;
		yourself
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> address: anAddress [ 
	address := anAddress
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> data [
	^ data
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> data: aData [ 
	data := aData
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> port: aPort [
	port := aPort
]

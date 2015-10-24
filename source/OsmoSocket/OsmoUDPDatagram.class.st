Class {
	#name : #OsmoUDPDatagram,
	#superclass : #Object,
	#instVars : [
		'port',
		'address',
		'data',
		'dataSize'
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
OsmoUDPDatagram >> address [
	^ address
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
OsmoUDPDatagram >> dataSize: aSize [
	dataSize := aSize
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> datagramHex [
	^(data copyFrom: 1 to: dataSize) hex
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> port [
	^ port
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> port: aPort [
	port := aPort
]

{ #category : #'as yet unclassified' }
OsmoUDPDatagram >> size [
	^dataSize isNil
		ifTrue: [data size]
		ifFalse: [dataSize]
]

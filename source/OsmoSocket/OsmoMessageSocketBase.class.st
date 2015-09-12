"
OsmoMessageSocket with only a rx process as the base
"
Class {
	#name : #OsmoMessageSocketBase,
	#superclass : #Object,
	#instVars : [
		'rx_proc',
		'tx_proc',
		'socket',
		'errorDelegate',
		'readDelegate',
		'terminated'
	],
	#category : #OsmoSocket
}

{ #category : #'private-read' }
OsmoMessageSocketBase >> dispatchOne [
	readDelegate readOneMessage: self.


]

{ #category : #'private-read' }
OsmoMessageSocketBase >> driveDispatch [
	[[
		self dispatchOne
	] on: ConnectionClosed do: [:e |
		self logError: 'Connection closed on read' area: #osmo.
		errorDelegate onReadError: self
	]] on: UnhandledError do: [:e |
		e logException: 'Driving failed' area: #osmo.
		errorDelegate onReadError: self].


]

{ #category : #configuration }
OsmoMessageSocketBase >> errorDelegate: aDelegate [
	errorDelegate := aDelegate
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketBase >> initialize [
	super initialize.
	terminated := false.
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketBase >> isTerminated [
	^terminated
]

{ #category : #reading }
OsmoMessageSocketBase >> next [
	^socket next
]

{ #category : #reading }
OsmoMessageSocketBase >> next: anInteger [
	^socket next: anInteger
]

{ #category : #reading }
OsmoMessageSocketBase >> nextByte [
	^socket nextByte
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketBase >> nextPut: aString [ 
	^socket nextPutAllFlush: aString
]

{ #category : #reading }
OsmoMessageSocketBase >> nextUshort [
	^socket nextUshort
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketBase >> readDelegate [
	^ readDelegate
]

{ #category : #configuration }
OsmoMessageSocketBase >> readDelegate: aDelegate [
	readDelegate := aDelegate
]

{ #category : #configuration }
OsmoMessageSocketBase >> socket: aSocket [
	socket := aSocket
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketBase >> startHandling [

	socket socket setOption: 'SO_KEEPALIVE' value: 1.

	rx_proc := [
		Processor activeProcess 
		    name: 'OsmoMessageSocket-RX ' , self targetDescription.
		[self driveDispatch] repeat] fork.
]

{ #category : #private }
OsmoMessageSocketBase >> targetDescription [
	"Determine from socket peerAddress/peerPort"
	self flag:#todo.
	^'FIXME'
]

{ #category : #private }
OsmoMessageSocketBase >> terminate [
	| proc |
	terminated := true.
	proc := Processor activeProcess.

	socket ifNotNil: [[socket close] ensure: [socket := nil]].

	"Kill the other two processes"
	tx_proc == proc ifTrue: [
		rx_proc ifNotNil: [rx_proc terminate].
		proc terminate].
	rx_proc == proc ifTrue: [
		tx_proc ifNotNil: [tx_proc terminate].
		proc terminate].

	tx_proc ifNotNil: [tx_proc terminate].
	rx_proc ifNotNil: [rx_proc terminate].

]

"
I help with protocols that transfer messages over a TCP connection.
"
Class {
	#name : #OsmoMessageSocket,
	#superclass : #Object,
	#instVars : [
		'rx_proc',
		'tx_proc',
		'socket',
		'writeQueue',
		'errorDelegate',
		'readDelegate',
		'terminated'
	],
	#category : #OsmoSocket
}

{ #category : #'private-read' }
OsmoMessageSocket >> dispatchOne [
	readDelegate readOneMessage: self.


]

{ #category : #'private-read' }
OsmoMessageSocket >> driveDispatch [
	[self dispatchOne] on: UnhandledError do: [:e |
		e logException: 'Driving failed' area: #osmo.
		errorDelegate onReadError: self].


]

{ #category : #'private-write' }
OsmoMessageSocket >> driveSend [
	[self sendOne] on: UnhandledError do: [:e |
		e logException: 'Sending failed' area: #osmo.
		errorDelegate onWriteError: self].
]

{ #category : #configuration }
OsmoMessageSocket >> errorDelegate: aDelegate [
	errorDelegate := aDelegate
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> initialize [
	super initialize.
	writeQueue := SharedQueue new.
	terminated := false.
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> isTerminated [
	^terminated
]

{ #category : #reading }
OsmoMessageSocket >> next [
	^socket next
]

{ #category : #reading }
OsmoMessageSocket >> next: anInteger [
	^socket next: anInteger
]

{ #category : #reading }
OsmoMessageSocket >> nextByte [
	^socket nextByte
]

{ #category : #reading }
OsmoMessageSocket >> nextUshort [
	^socket nextUshort
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> readDelegate [
	^ readDelegate
]

{ #category : #configuration }
OsmoMessageSocket >> readDelegate: aDelegate [
	readDelegate := aDelegate
]

{ #category : #'private-write' }
OsmoMessageSocket >> sendOne [
	| msg |
	msg := writeQueue next.
	msg ifNil: [^self terminate].
	socket nextPutAllFlush: msg

]

{ #category : #configuration }
OsmoMessageSocket >> socket: aSocket [
	socket := aSocket
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> startHandling [

	socket socket setOption: 'SO_KEEPALIVE' value: 1.

	rx_proc := [
		Processor activeProcess 
		    name: 'OsmoMessageSocket-RX ' , self targetDescription.
		[self driveDispatch] repeat] fork.
	tx_proc := [
		Processor activeProcess 
		    name: 'OsmoMessageSocket-TX ' , self targetDescription.
		[self driveSend] repeat]  fork.
]

{ #category : #private }
OsmoMessageSocket >> targetDescription [
	"Determine from socket peerAddress/peerPort"
	self flag:#todo.
	^'FIXME'
]

{ #category : #private }
OsmoMessageSocket >> terminate [
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

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> writeQueue [
	^ writeQueue
]

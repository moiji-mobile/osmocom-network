"
I am a delegate for the OsmoMessageConnection.

My task is to observe and re-create the sockets.
"
Class {
	#name : #OsmoMessageConnection,
	#superclass : #Object,
	#instVars : [
		'hostname',
		'port',
		'started',
		'socket',
		'readDelegate',
		'reconnectTimer'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageConnection class >> connectionException [
	^ConnectionTimedOut

]

{ #category : #'as yet unclassified' }
OsmoMessageConnection class >> osmoMessageSocket [
	^OsmoMessageSocket
]

{ #category : #private }
OsmoMessageConnection >> connect [
	| tcpSocket |
	tcpSocket := (SocketStream openConnectionToHostNamed: hostname port: port)
					binary; noTimeout; yourself.
	socket := self class osmoMessageSocket new
					errorDelegate: self;
					readDelegate: readDelegate;
					socket: tcpSocket;
					yourself.
	readDelegate onNewConnection: socket.
	socket startHandling.
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> hostname: aHostname [
	hostname := aHostname
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> initialize [
	super initialize.
	started := false.
	readDelegate := OsmoMessageReadDelegate new.
]

{ #category : #delegated }
OsmoMessageConnection >> onReadError: aSocket [
	socket == aSocket ifFalse: [
		^self].

	self socketError: aSocket.
]

{ #category : #delegated }
OsmoMessageConnection >> onWriteError: aSocket [
	socket == aSocket ifFalse: [
		^self].

	self socketError: aSocket.
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> port: aPort [
	port := aPort
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> readDelegate: aDelegate [
	readDelegate := aDelegate
]

{ #category : #private }
OsmoMessageConnection >> reconnect [

	[
		reconnectTimer := nil.
		self logNotice: 'Attempting to connect to ' , self targetDescription area: #osmo.
		self connect
	] on: self class connectionException do: [:e |
		e logError: 'Failed to connect to ' , self targetDescription area: #osmo.
		self scheduleReconnect
	].
]

{ #category : #private }
OsmoMessageConnection >> scheduleReconnect [
	reconnectTimer := TimerScheduler instance scheduleInSeconds: 1 block: [self reconnect]
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> socketError: aSocket [
	socket := nil.
	self scheduleReconnect.

	"We might not run after this statement"
	aSocket terminate.
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> start [
	started := true.
	self reconnect.
]

{ #category : #'as yet unclassified' }
OsmoMessageConnection >> stop [
	started := false.
	socket ifNotNil: [
		[socket terminate] ensure: [socket := nil]].
	reconnectTimer ifNotNil: [reconnectTimer cancel].
	reconnectTimer := nil.

]

{ #category : #private }
OsmoMessageConnection >> targetDescription [
	^(WriteStream on: String new)
	    nextPutAll: hostname;
	    nextPut: $:;
	    nextPutAll: port asString;
	    contents

]

"
I help with protocols that transfer messages over a TCP connection.
"
Class {
	#name : #OsmoMessageSocket,
	#superclass : #OsmoMessageSocketBase,
	#instVars : [
		'writeQueue'
	],
	#category : #OsmoSocket
}

{ #category : #'private-write' }
OsmoMessageSocket >> driveSend [
	[self sendOne] on: UnhandledError do: [:e |
		e logException: 'Sending failed' area: #osmo.
		errorDelegate onWriteError: self].
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> initialize [
	super initialize.
	writeQueue := SharedQueue new.
]

{ #category : #'private-write' }
OsmoMessageSocket >> sendOne [
	| msg |
	msg := writeQueue next.
	msg ifNil: [^self terminate].
	socket nextPutAllFlush: msg

]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> startHandling [
	super startHandling.

	socket socket setOption: 'SO_KEEPALIVE' value: 1.

	tx_proc := [
		Processor activeProcess 
		    name: 'OsmoMessageSocket-TX ' , self targetDescription.
		[self driveSend] repeat]  fork.
]

{ #category : #'as yet unclassified' }
OsmoMessageSocket >> writeQueue [
	^ writeQueue
]

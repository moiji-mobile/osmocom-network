Class {
	#name : #OsmoUDPSocketTest,
	#superclass : #TestCase,
	#category : #'OsmoNetwork-Tests'
}

{ #category : #'as yet unclassified' }
OsmoUDPSocketTest >> createSocket [
	^Socket newUDP

]

{ #category : #'as yet unclassified' }
OsmoUDPSocketTest >> startRXProcess [
	^
	[
	[
	[Processor activeProcess name: name , ' RX'.
	self runRXProcess] 
		on: ConnectionClosed
		do: [^self]] 
		ensure: [net_exit signal]] 
		fork

]

{ #category : #'as yet unclassified' }
OsmoUDPSocketTest >> testSocketCreation [
	| socket rx tx |
	socket := (OsmoUDPSocket new)
		    name: 'Test Socket';
		    start: self createSocket;
		    yourself.

	"Verify that we are in processing"
	rx := socket instVarNamed: #rx.
	tx := socket instVarNamed: #tx.
	self deny: rx isTerminated.
	self deny: tx isTerminated.
	socket stop.
	self assert: rx isTerminated.
	self assert: tx isTerminated

]

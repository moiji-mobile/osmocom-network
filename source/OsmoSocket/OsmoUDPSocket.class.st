"
I help in sending and dispatching UDP messages. I will
    start two processes for socket handling.
"
Class {
	#name : #OsmoUDPSocket,
	#superclass : #Object,
	#instVars : [
		'socket',
		'queue',
		'rx',
		'tx',
		'net_exit',
		'name',
		'on_data',
		'txLock'
	],
	#category : #'OsmoSocket-Legacy'
}

{ #category : #creation }
OsmoUDPSocket >> initialize [
	queue := SharedQueue new.
	net_exit := Semaphore new.
	txLock := Semaphore forMutualExclusion.

]

{ #category : #creation }
OsmoUDPSocket >> name: aName [
	name := aName

]

{ #category : #creation }
OsmoUDPSocket >> onData: aBlock [
	on_data := aBlock

]

{ #category : #sending }
OsmoUDPSocket >> queueData: aData [
	queue nextPut: aData

]

{ #category : #processing }
OsmoUDPSocket >> runRXProcess [
	[ 
		|  datagram |
		socket ensureReadable.
		socket isOpen
			ifFalse: [ ^ self logNotice: name , ' socket closed.' area: #core ].
		datagram := socket next.
		on_data value: datagram.
	] repeat
]

{ #category : #processing }
OsmoUDPSocket >> runTXProcess [
	[ 
		| datagram |
		datagram := queue next.
		datagram = nil
			ifTrue: [^self logNotice: name , ' TX asked to quit.' area: #core].
		socket sendUDPData: datagram data toHost:  datagram address port: datagram port.
	] repeat
]

{ #category : #'as yet unclassified' }
OsmoUDPSocket >> sendDatagram: datagram [

	"The Pharo Socket implementation is crazy. The below routine might split the data
	into multiple datagrams! So add a lock to prevent the theoretical issue of multiple
	processes sending at the same time and mixing their data"
	^txLock critical: [
		socket sendUDPData: datagram data toHost:  datagram address port: datagram port]

]

{ #category : #creation }
OsmoUDPSocket >> start: aSocket [
	socket := aSocket.

	"Receive datagrams from the socket..."
	rx := self startRXProcess.

	"Send data to the MGWs"
	tx := 
		[
		[Processor activeProcess name: name , ' TX'.
		self runTXProcess] 
			ensure: [net_exit signal]] 
			fork

]

{ #category : #'as yet unclassified' }
OsmoUDPSocket >> startRXProcess [
	^
	[
	[
	[Processor activeProcess name: name , ' RX'.
	self runRXProcess] 
		on: ConnectionClosed
		do: []] 
		ensure: [net_exit signal]] 
		fork

]

{ #category : #processing }
OsmoUDPSocket >> stop [
	socket ifNil: [^self].

	"Close"
	socket close.
	queue nextPut: nil.

	"Wait for the process to exit"
	self logNotice: name , ' waiting for IO handlers to exit.' area: #core.
	net_exit
	    wait;
	    wait.

	"Forget things"
	socket := nil.
	tx := nil.
	rx := nil

]

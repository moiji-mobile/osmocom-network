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
		'on_data'
	],
	#category : #'OsmoNetwork-Socket'
}

{ #category : #creation }
OsmoUDPSocket class >> new [
	^(super new)
	    initialize;
	    yourself

]

{ #category : #creation }
OsmoUDPSocket >> initialize [
	queue := SharedQueue new.
	net_exit := Semaphore new

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
	[| data |
	socket ensureReadable.
	socket isOpen 
	    ifFalse: [^self logNotice: name , ' socket closed.' area: #core].
	data := socket next.
	on_data value: data] 
		repeat

]

{ #category : #processing }
OsmoUDPSocket >> runTXProcess [
	[| data |
	data := queue next.
	data = nil 
	    ifTrue: [^self logNotice: name , ' TX asked to quit.' area: #core].
	socket nextPut: data] 
		repeat

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

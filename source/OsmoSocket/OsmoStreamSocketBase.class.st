"
I am the base class for streaming related sockets. I help with
supervising the RX/TX process and re-starting.
"
Class {
	#name : #OsmoStreamSocketBase,
	#superclass : #Object,
	#instVars : [
		'socket',
		'hostname',
		'port',
		'tx_proc',
		'rx_proc',
		'started'
	],
	#category : #'OsmoSocket-Legacy'
}

{ #category : #'pharo-porting' }
OsmoStreamSocketBase class >> connectionException [
	^ConnectionTimedOut

]

{ #category : #connect }
OsmoStreamSocketBase >> connect [
	socket ifNotNil: [socket close].
	socket := self createConnection: hostname port: port

]

{ #category : #internal }
OsmoStreamSocketBase >> createConnection: aHostname port: aPort [
	self subclassResponsibility

]

{ #category : #internal }
OsmoStreamSocketBase >> dispatchOne [
	self subclassResponsibility

]

{ #category : #private }
OsmoStreamSocketBase >> driveDispatch [
	[[self dispatchOne] on: ConnectionClosed
	    do: 
		[:e | 
		self logError: 'OsmoApplication dispatch failed.' area: #osmo.
		self scheduleReconnect]] 
		on: Error
		do: 
		    [:e | 
		    e logException: 'OsmoApplication error' area: #osmo.
		    self scheduleReconnect]

]

{ #category : #private }
OsmoStreamSocketBase >> driveSend [
	[self sendOne] on: ConnectionClosed
	    do: 
		[:e | 
		e logException: 'OsmoAppConnection send failed' area: #osmo.
		self scheduleReconnect]

]

{ #category : #accessing }
OsmoStreamSocketBase >> hostname [
	^hostname

]

{ #category : #creation }
OsmoStreamSocketBase >> hostname: aHostname [
	hostname := aHostname

]

{ #category : #'as yet unclassified' }
OsmoStreamSocketBase >> isConnected [
	^started and: [socket isNil not]
]

{ #category : #accessing }
OsmoStreamSocketBase >> port [
	^port

]

{ #category : #creation }
OsmoStreamSocketBase >> port: aPort [
	port := aPort

]

{ #category : #private }
OsmoStreamSocketBase >> reconnect [
	self logNotice: 'Going to reconnect socket to ' , self targetDescription
	    area: #osmo.
	self terminate.
	started ifTrue: [self start]

]

{ #category : #private }
OsmoStreamSocketBase >> scheduleReconnect [
	socket ifNotNil: 
		[socket close.
		socket := nil].
	TimerScheduler instance scheduleInSeconds: 1 block: [self reconnect].
	"We are done now"
	Processor activeProcess terminate

]

{ #category : #internal }
OsmoStreamSocketBase >> sendOne [
	self subclassResponsibility

]

{ #category : #connect }
OsmoStreamSocketBase >> start [
	started := true.
	
	[self logNotice: 'Attempting to connect to ' , self targetDescription
	    area: #osmo.
	self connect] 
		on: self class connectionException
		do: 
		    [self logError: 'Failed to connect to ' , self targetDescription area: #osmo.
		    ^TimerScheduler instance scheduleInSeconds: 1 block: [self reconnect]].
	rx_proc := 
		[Processor activeProcess 
		    name: 'OsmoAppConnection-RX ' , self targetDescription.
		[self driveDispatch] repeat] 
			fork.
	tx_proc := 
		[Processor activeProcess 
		    name: 'OsmoAppConnection-TX ' , self targetDescription.
		[self driveSend] repeat] 
			fork

]

{ #category : #connect }
OsmoStreamSocketBase >> stop [
	started := false.
	self terminate
	"A reconnect timer might be running right now"

]

{ #category : #accessing }
OsmoStreamSocketBase >> targetDescription [
	^(WriteStream on: String new)
	    nextPutAll: hostname;
	    nextPut: $:;
	    nextPutAll: port asString;
	    contents

]

{ #category : #connect }
OsmoStreamSocketBase >> terminate [
	tx_proc ifNotNil: [tx_proc terminate].
	rx_proc ifNotNil: [rx_proc terminate].
	socket ifNotNil: [[socket close] ensure: [socket := nil]]

]

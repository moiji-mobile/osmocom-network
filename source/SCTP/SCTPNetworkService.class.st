"
I should probably model SCTP primitives from a IETF RFC but I don't. I provide the minimal set of abstraction to connect to the underlying SCTP sub-system
"
Class {
	#name : #SCTPNetworkService,
	#superclass : #OsmoStreamSocketBase,
	#instVars : [
		'writeQueue',
		'on_sctp_connect_block',
		'on_sctp_released_block',
		'on_sctp_data'
	],
	#category : #SCTP
}

{ #category : #sctp }
SCTPNetworkService >> connect [
	super connect.
	socket enableDataIOEvent.
	writeQueue := SharedQueue new.
	on_sctp_connect_block ifNotNil: [on_sctp_connect_block value].
]

{ #category : #sctp }
SCTPNetworkService >> createConnection: aHost port: aPort [
	^Socket newSCTP
		connectToHostNamed: aHost port: aPort;
		enableDataIOEvent;
		yourself
]

{ #category : #sctp }
SCTPNetworkService >> dispatchOne [
	| data res |
	data := ByteArray new: 4096.
	socket
		waitForDataFor: 2
		ifClosed: [ConnectionClosed signal: 'Connection closed while waiting for data.']
		ifTimedOut: [^self].
	
	res := socket receiveSCTPDataInto: data.
	on_sctp_data
		value: (res at: 4)
		value: (res at: 5)
		value: (res at: 6)
		value: (data copyFrom: 1 to: res first).
]

{ #category : #sctp }
SCTPNetworkService >> nextPut: aMsg [
	self nextPut: aMsg on: 1
]

{ #category : #sctp }
SCTPNetworkService >> nextPut: aMsg on: aStream [
	writeQueue nextPut: (Array with: aStream with: aMsg).
]

{ #category : #notifications }
SCTPNetworkService >> onSctpConnect: aBlock [
	on_sctp_connect_block := aBlock
]

{ #category : #notifications }
SCTPNetworkService >> onSctpData: aBlock [
	on_sctp_data := aBlock.
]

{ #category : #notifications }
SCTPNetworkService >> onSctpReleased: aBlock [
	on_sctp_released_block := aBlock
]

{ #category : #sctp }
SCTPNetworkService >> sendOne [
	| msg |
	msg := writeQueue next.
	socket sendDataSCTP: msg second stream: msg first assoc: 1 ppid: 2.
]

{ #category : #sctp }
SCTPNetworkService >> terminate [
	super terminate.
	on_sctp_released_block ifNotNil: [on_sctp_released_block value].
]

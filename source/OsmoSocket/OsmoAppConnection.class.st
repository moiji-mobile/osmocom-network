"
I connect to a OpenBSC App on the Control Port and wait for
TRAPS coming from the server and will act on these.
TODO: re-use the IPADispatcher across connections.
"
Class {
	#name : #OsmoAppConnection,
	#superclass : #OsmoStreamSocketBase,
	#instVars : [
		'writeQueue',
		'demuxer',
		'muxer',
		'dispatcher',
		'token',
		'connect_block'
	],
	#category : #'OsmoSocket-Legacy'
}

{ #category : #'pharo-porting' }
OsmoAppConnection class >> connectionException [
	^ConnectionTimedOut

]

{ #category : #'as yet unclassified' }
OsmoAppConnection class >> new [
	^(self basicNew)
	    hostname: '127.0.0.1';
	    port: 4250;
	    yourself

]

{ #category : #connect }
OsmoAppConnection >> connect [
	super connect.
	writeQueue := SharedQueue new.
	demuxer := IPADemuxer initOn: socket.
	muxer := IPAMuxer initOn: writeQueue.
	self initializeDispatcher

]

{ #category : #'pharo-porting' }
OsmoAppConnection >> createConnection: aHostname port: aPort [
	| streamSocket |
	streamSocket := (SocketStream openConnectionToHostNamed: aHostname port: aPort)
	    binary;
	    noTimeout;
	    yourself.
	streamSocket socket setOption: 'TCP_NODELAY' value: 1.
	^streamSocket
]

{ #category : #dispatch }
OsmoAppConnection >> dispatchOne [
	| msg |
	msg := demuxer next.
	dispatcher dispatch: msg first with: msg second

]

{ #category : #'as yet unclassified' }
OsmoAppConnection >> initializeDispatcher [
	"Allow another class to register handlers"

	| ipa |
	dispatcher := IPADispatcher new.
	dispatcher initialize.
	connect_block ifNotNil: [connect_block value: dispatcher].
	ipa := (IPAProtoHandler new)
		    registerOn: dispatcher;
		    muxer: muxer;
		    token: token;
		    yourself

]

{ #category : #'as yet unclassified' }
OsmoAppConnection >> nextPut: aData [
	muxer nextPut: aData with: IPAConstants protocolOsmoCTRL

]

{ #category : #'as yet unclassified' }
OsmoAppConnection >> nextPut: aData with: aConstant [
	muxer nextPut: aData with: aConstant

]

{ #category : #creation }
OsmoAppConnection >> onConnect: aBlock [
	"Call the block when the socket is being connected and the dispatcher
	 is set-up. The callback will have the dispatcher as parameter."
	connect_block := aBlock

]

{ #category : #dispatch }
OsmoAppConnection >> sendOne [
	| msg |
	msg := writeQueue next.
	socket nextPutAllFlush: msg

]

{ #category : #'as yet unclassified' }
OsmoAppConnection >> token: aToken [
	token := aToken

]

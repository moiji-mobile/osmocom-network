"
I listen for connections and handle requests. I don't deal with image suspend/resume yet.. specially as this is a nightmare in Pharo.
"
Class {
	#name : #BERTRPCServer,
	#superclass : #Object,
	#instVars : [
		'quit',
		'socket',
		'acceptLoop',
		'modules'
	],
	#category : #'BERT-RPC'
}

{ #category : #'as yet unclassified' }
BERTRPCServer >> acceptConnections [
	[quit] whileFalse: [
		self acceptOneConnection.
		
		"Pharo sockets are strange. Check if it is still valid after image
		resumption and just return. We need some other way to stop/resume
		the socket across image starts but this stops a 100% CPU usage."
		socket isValid ifFalse: [
			self flag: #todo. "Add logging"
			^self].
	]
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> acceptOneConnection [
	| client |
	client := socket waitForAcceptFor: 60.
	client ifNil: [^self].

	client setOption: 'TCP_NODELAY' value: 1.
	OsmoDispatcher dispatchBlock:  [
		|  socketStream |
		socketStream := (SocketStream on: client)
				binary;
	    			noTimeout;
				yourself.
		self handleNewConnection: socketStream.
	].
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> bind: anAddServer as: aString with: aCollection [ 
	self modules
		at: aString put: (anAddServer -> aCollection)
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> findModule: aModule function: aFunction [
	"aCollection second contains the module name and third is the
	function to call. Now the function name doesn't really lend itself
	to Smalltalk. This is why we have an explicit bind here."
	| res selector |
	res := self modules at: aModule asString ifAbsent: [^nil].
	selector := res value at: aFunction asString ifAbsent: [^nil].
	^{res key. selector}
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> handleNewConnection: aStream [ 
	| conn |
	conn := BERTRPCClientConnection new
				server: self;
				socket: aStream;
				yourself.
	conn start.
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> initialize [
	super initialize.
	modules := Dictionary new.
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> modules [
	^modules
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> selectCall: aCollection [ 
	"aCollection second contains the module name and third is the
	function to call. Now the function name doesn't really lend itself
	to Smalltalk. This is why we have an explicit bind here and will
	return the selector and the object to perform it on."
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> start: aPort [
	quit := false.
	socket := Socket newTCP.
	socket listenOn: aPort backlogSize: 4.

	socket localPort = aPort ifFalse: [
		^self error: 'Port already bound'].

	"Defaults for Pharo otherwise things don't work."
	socket 
		setOption: 'SO_SNDBUF' value: 4096;
		setOption: 'SO_RCVBUF' value: 4096.

	acceptLoop := [
		self acceptConnections] newProcess.
	acceptLoop name: 'BERTRPCServer acceptLoop'.
	acceptLoop resume.
]

{ #category : #'as yet unclassified' }
BERTRPCServer >> stop [
	quit := true.
	socket ifNotNil: [socket closeAndDestroy].
	acceptLoop ifNotNil: [acceptLoop terminate].
]

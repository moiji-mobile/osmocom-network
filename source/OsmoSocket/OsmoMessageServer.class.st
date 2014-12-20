"
I listen to incoming TCP connections and
create OsmoMessageSockets for them with the delegates I have.

I keep track of all connections and there
might be a subclass that is more strictly
enforcing a connection limit.
"
Class {
	#name : #OsmoMessageServer,
	#superclass : #Object,
	#instVars : [
		'quit',
		'socket',
		'acceptLoop',
		'serverDelegate',
		'sem',
		'clientConnections'
	],
	#category : #OsmoSocket
}

{ #category : #private }
OsmoMessageServer >> acceptConnections [
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

{ #category : #private }
OsmoMessageServer >> acceptOneConnection [
	| client |
	client := socket waitForAcceptFor: 60.
	client ifNil: [^self].
	
	OsmoDispatcher dispatchBlock:  [
		| conn socketStream |
		socketStream := (SocketStream on: client)
				binary;
	    			noTimeout;
				yourself.
		conn := OsmoMessageSocket new
				errorDelegate: self;
				socket: socketStream;
				yourself.
		[
			serverDelegate onNewConnection: conn.
			self addClientConnection: conn.
			conn startHandling.
		] ifCurtailed: [self removeAndTerminateConnection: conn ]].
]

{ #category : #private }
OsmoMessageServer >> addClientConnection: aConnection [
	sem critical: [clientConnections add: aConnection]
]

{ #category : #'as yet unclassified' }
OsmoMessageServer >> allConnections [
	^sem critical: [clientConnections copy]
]

{ #category : #'as yet unclassified' }
OsmoMessageServer >> closeAllConnections [
	self allConnections do: [:each |
		self removeAndTerminateConnection: each]
]

{ #category : #private }
OsmoMessageServer >> handleError: aConnection [
	self removeAndTerminateConnection: aConnection
	
]

{ #category : #private }
OsmoMessageServer >> initialize [
	super initialize.
	sem := Semaphore forMutualExclusion.
	clientConnections := OrderedCollection new.
]

{ #category : #delegated }
OsmoMessageServer >> onReadError: aConnection [
	self handleError: aConnection.

]

{ #category : #delegated }
OsmoMessageServer >> onWriteError: aConnection [
	self handleError: aConnection
]

{ #category : #private }
OsmoMessageServer >> removeAndTerminateConnection: aConnection [
	self removeConnection: aConnection.
	aConnection terminate.
	
]

{ #category : #private }
OsmoMessageServer >> removeConnection: aConnection [
	"There are two paths to have the connection de-registered. Deal
	with it already being dead."
	sem critical: [clientConnections remove: aConnection ifAbsent: []]
]

{ #category : #'as yet unclassified' }
OsmoMessageServer >> serverDelegate: aDelegate [
	serverDelegate := aDelegate
]

{ #category : #'as yet unclassified' }
OsmoMessageServer >> start: aPort [
	quit := false.
	socket := Socket newTCP.
	socket listenOn: aPort backlogSize: 4.

	"Defaults for Pharo otherwise things don't work."
	socket 
		setOption: 'SO_SNDBUF' value: 4096;
		setOption: 'SO_RCVBUF' value: 4096.

	acceptLoop := [
		self acceptConnections] newProcess.
	acceptLoop name: 'OsmoMessageServer acceptLoop'.
	acceptLoop resume.
]

{ #category : #'as yet unclassified' }
OsmoMessageServer >> stop [
	quit := true.
	socket ifNotNil: [socket closeAndDestroy].
	acceptLoop ifNotNil: [acceptLoop terminate].
]

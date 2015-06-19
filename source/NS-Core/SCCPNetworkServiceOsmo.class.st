Class {
	#name : #SCCPNetworkServiceOsmo,
	#superclass : #SCCPNetworkService,
	#instVars : [
		'conn',
		'receiveThrottle',
		'rxCounter'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo class >> instance [
	^ instance ifNil: [ 
		instance := self new ]
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo class >> new [
	^ self basicNew
				initialize;
				yourself.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> doSend: aMessage to: aToPoc from: aFromPoc [
	conn nextPut: aMessage with: IPAConstants protocolSCCP.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> hostname: aHostname port: aPort [
	conn
		hostname: aHostname;
		port: aPort.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> initialize [
	super initialize.
	receiveThrottle := 20.
	rxCounter := 0.
	conn := OsmoAppConnection new
				onConnect: [:dispatcher | self registerOn: dispatcher];
				yourself.
]

{ #category : #private }
SCCPNetworkServiceOsmo >> ipaRecv: aMsg [
	| dispatcher pendingBlocks |
	dispatcher := Dispatcher instance.
	pendingBlocks := dispatcher pendingBlocks.

	"This atomicity is not guranteed"
	rxCounter := rxCounter + 1.

	pendingBlocks > receiveThrottle ifTrue: [
		logger logNotice: 'Throttling SCCP message dispatch' with: { 'msg' -> aMsg. 'pending' -> pendingBlocks}.
		^self].

	dispatcher dispatchBlock: [
		self doReceive: aMsg]. 
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> readResetRxCounter [
	| res |
	res := rxCounter.
	rxCounter := 0.
	^res
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> receiveThrottle: anInteger [ 
	receiveThrottle := anInteger
]

{ #category : #private }
SCCPNetworkServiceOsmo >> registerOn: aDispatcher [
	aDispatcher addHandler: IPAConstants protocolSCCP on: [:msg | self ipaRecv: msg].
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> start [
	conn start.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> stop [
	conn stop
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> token: aToken [
	"Forward the token to the connection."
	conn token: aToken.
]

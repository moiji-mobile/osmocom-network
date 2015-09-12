"
I push data into a blocking queue. My user then can use one or more workers to pull data out of the socket.
"
Class {
	#name : #SCCPNetworkServiceOsmo,
	#superclass : #SCCPNetworkServiceOsmoBase,
	#instVars : [
		'receiveThrottle'
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

{ #category : #private }
SCCPNetworkServiceOsmo >> doIpaRecv: aMsg [
	| dispatcher pendingBlocks |
	dispatcher := Dispatcher instance.
	pendingBlocks := dispatcher pendingBlocks.

	pendingBlocks > receiveThrottle ifTrue: [
		logger logNotice: 'Throttling SCCP message dispatch' with: { 'msg' -> aMsg. 'pending' -> pendingBlocks}.
		^self].

	dispatcher dispatchBlock: [
		self doReceive: aMsg]. 
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> doSend: aMessage to: aToPoc from: aFromPoc [
	conn nextPut: aMessage with: IPAConstants protocolSCCP.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> initialize [
	super initialize.
	receiveThrottle := 20.
	conn := OsmoAppConnection new
				onConnect: [:dispatcher | self registerOn: dispatcher];
				yourself.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> receiveThrottle: anInteger [ 
	receiveThrottle := anInteger
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmo >> token: aToken [
	"Forward the token to the connection."
	conn token: aToken.
]

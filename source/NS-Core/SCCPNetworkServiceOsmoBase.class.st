"
Base for Osmo/IPA based sockets

There is SCCPNetworkServiceOsmo which is a push handler and
SCCPNetworkServiceOsmoDirect which is a pull handler for read and a blocking write.
"
Class {
	#name : #SCCPNetworkServiceOsmoBase,
	#superclass : #SCCPNetworkService,
	#instVars : [
		'conn',
		'rxCounter'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase class >> instance [
	^ instance ifNil: [ 
		instance := self new ]
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase class >> new [
	^ self basicNew
				initialize;
				yourself.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> doSend: aMessage to: aToPoc from: aFromPoc [
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> hostname: aHostname port: aPort [
	conn
		hostname: aHostname;
		port: aPort.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> initialize [
	super initialize.
	rxCounter := 0.
]

{ #category : #private }
SCCPNetworkServiceOsmoBase >> ipaRecv: aMsg [

	"This atomicity is not guranteed"
	rxCounter := rxCounter + 1.
	self doIpaRecv: aMsg.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> readResetRxCounter [
	| res |
	res := rxCounter.
	rxCounter := 0.
	^res
]

{ #category : #private }
SCCPNetworkServiceOsmoBase >> registerOn: aDispatcher [
	aDispatcher addHandler: IPAConstants protocolSCCP on: [:msg | self ipaRecv: msg].
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> start [
	conn start.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> stop [
	conn stop
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoBase >> token: aToken [
	^self subclassResponsibility
]

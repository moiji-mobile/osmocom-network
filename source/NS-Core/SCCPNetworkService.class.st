"
I am the base for SCCP Network Services. I provide a way to send and receive SCCP messages. My subclasses know how to route these.

I model Q.711 to some degree. Right now only UnitData (UDT) is handled. For connection orientated data there is already an object orientated approach that could be changed to use this class for dispatching.

Currently only 'CLASS-0' kind of traffic is supported.
"
Class {
	#name : #SCCPNetworkService,
	#superclass : #Object,
	#instVars : [
		'on_data',
		'defaultRoute',
		'logger',
		'connectionName'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkService class >> layer [
	^ self
]

{ #category : #'as yet unclassified' }
SCCPNetworkService >> connectionName: aName [ 
	connectionName := aName
]

{ #category : #routing }
SCCPNetworkService >> defaultRoute [
	^defaultRoute
]

{ #category : #routing }
SCCPNetworkService >> defaultRoute: aRoute [
	"Set the default route. It should be a dictionary with DPC/OPC"
	defaultRoute := aRoute
]

{ #category : #internal }
SCCPNetworkService >> doReceive: aMsg [
	| msg |
	msg := SCCPMessage decode: aMsg.
	"double dispatch to the UDT message"
	msg tcapNetworkServiceDispatch: self.
]

{ #category : #internal }
SCCPNetworkService >> doSend: aMessage to: aToPoc from: aFromPoc [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SCCPNetworkService >> initialize [
	super initialize.
	logger := LogStructuredLogger for: self area: #sccp.
]

{ #category : #registration }
SCCPNetworkService >> onUnitData: aBlock [
	"Reported when data has arrived. The callback will include the:
		calling address
		called address
		the data as a byte array."
	on_data := aBlock.
]

{ #category : #routing }
SCCPNetworkService >> selectRouteTo: calledAddress from: callingAddress [

	"Do we know where to send things?"
	(calledAddress pointCode isNil not and: [callingAddress isNil not])
		ifTrue: [^Dictionary new
					at: 'dpc' put: calledAddress pointCode;
					at: 'opc' put: callingAddress pointCode;
					yourself].

	"Global Title Translation and other buzzwords here... we would need to
	look at the routing indicator for both of it. Currently we assume a default
	target."
	self flag: #todo. "See above".
	^self defaultRoute.
]

{ #category : #sending }
SCCPNetworkService >> sendUnitData: aByteArray to: calledAddr from: callingAddr [
	"Send data to a specified address or raise an exception if the address is
	not routable."
	"Q.711 wants us to have:
	   * Called address
	   * Calling address
	   * Sequence ControlaByteArray
	   * Return Option
	   * Importance
	   * User Data"
	| udt routing |
	udt := SCCPUDT initWith: calledAddr calling: callingAddr data: aByteArray.
	routing := self selectRouteTo: calledAddr from: callingAddr.

	"TODO: not very clever.. This routing is not really though out. There should be default
	point codes? Why is there a default route? I want to make some quick progress right now."
	self flag: #todo.
	^routing isNil
		ifTrue: [
			self doSend: udt toMessage asByteArray to: 0 from: 0]
		ifFalse: [
			self
				doSend: udt toMessage asByteArray
				to: (routing at: 'dpc')
				from: (routing at: 'opc')]
]

{ #category : #internal }
SCCPNetworkService >> signalUnitData: msg [
	<tcapMethod>
	"Inform the upper layer about data"
	on_data ifNotNil: [
		on_data cull: msg calledAddr cull: msg callingAddr cull: msg data cull: msg]
]

Class {
	#name : #SCCPMockNetworkService,
	#superclass : #SCCPNetworkService,
	#instVars : [
		'otherService',
		'messageQueue',
		'sentPackets',
		'receivedPackets',
		'autoDispatch'
	],
	#category : #'NS-Core-Tests'
}

{ #category : #accessing }
SCCPMockNetworkService >> autoDispatch: aBoolean [
	autoDispatch := aBoolean
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> connectTo: aService [
	otherService := aService.
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> defaultRoute [
	^Dictionary new
		at: 'dpc' put: 10;
		at: 'opc' put: 20;
		yourself
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> dequeueMessage [
	^messageQueue removeFirst
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> dispatchMessages [
	messageQueue do: [ :message |
		sentPackets add: (SCCPMessage decode: message) data.
		otherService doReceive: message ]
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> doSend: aByteArray to: calledAddr from: callingAddr [
	(otherService notNil & autoDispatch) 
		ifTrue: [
			sentPackets add: (SCCPMessage decode: aByteArray) data.
			otherService doReceive: aByteArray ]
		ifFalse: [ messageQueue add: aByteArray ] 

]

{ #category : #'initialize-release' }
SCCPMockNetworkService >> initialize [ 
	super initialize.
	autoDispatch := true.
	sentPackets := OrderedCollection new.
	receivedPackets := OrderedCollection new.
	messageQueue := OrderedCollection new.
]

{ #category : #accessing }
SCCPMockNetworkService >> receivedPackets [
	^ receivedPackets
]

{ #category : #accessing }
SCCPMockNetworkService >> sentPackets [
	^ sentPackets
]

{ #category : #'as yet unclassified' }
SCCPMockNetworkService >> signalUnitData: msg [
	receivedPackets add: msg data.
	super signalUnitData: msg.
	
]

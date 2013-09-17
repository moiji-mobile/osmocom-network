"
I am a facade to a SCCPNetworkService and allow multiple SCCP.USERS to register. Currently this is done based on the SSN.
"
Class {
	#name : #SCCPNetworkServiceBinder,
	#superclass : #Object,
	#instVars : [
		'service',
		'bindings'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkServiceBinder class >> on: aService [
	^ self new
		underlyingService: aService;
		yourself.
]

{ #category : #registration }
SCCPNetworkServiceBinder >> bindSsn: aSsn with: aBlock [
	self bindings at: aSsn put: aBlock.
]

{ #category : #private }
SCCPNetworkServiceBinder >> bindings [
	^ bindings ifNil: [bindings := Dictionary new].
]

{ #category : #private }
SCCPNetworkServiceBinder >> routeTo: aCalled calling: aCalling data: aData [
	| ssn |
	ssn := aCalled ssn.
	"Forward to the real handler"
	(self bindings at: ssn) value: aCalled value: aCalling value: aData.
]

{ #category : #sending }
SCCPNetworkServiceBinder >> sendUnitData: aByteArray to: calledAddr from: callingAddr [
	service sendUnitData: aByteArray to: calledAddr from: callingAddr
]

{ #category : #creation }
SCCPNetworkServiceBinder >> underlyingService: aService [
	service := aService.
	service onUnitData: [:called :calling :data |
							self routeTo: called calling: calling data: data].
]

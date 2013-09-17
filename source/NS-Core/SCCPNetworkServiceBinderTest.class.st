Class {
	#name : #SCCPNetworkServiceBinderTest,
	#superclass : #TestCase,
	#category : #'NS-Core-Tests'
}

{ #category : #tests }
SCCPNetworkServiceBinderTest >> testBindings [
	| binder |
	"Tests SCCPNetworkServiceBinder>>#bindings"
	binder := SCCPNetworkServiceBinder on: (SCCPMockNetworkService new).
	binder bindSsn: SCCPAddress ssnHLR with: 10.
	self assert: (binder bindings at: SCCPAddress ssnHLR)  = 10.
]

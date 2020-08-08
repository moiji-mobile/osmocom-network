Class {
	#name : #SCCPNetworkDebugHelper,
	#superclass : #Object,
	#category : #'NS-Core-Tests'
}

{ #category : #'as yet unclassified' }
SCCPNetworkDebugHelper class >> sendTCAP: aByteArray [
	| networkService server conn |
	"Initialize a pair of server and client"
	networkService := SCCPNetworkServiceOsmoDirect new
		hostname: 'localhost' port: 5000;
		yourself.
	server := ZnNetworkingUtils serverSocketOn: 5000.
	conn := nil.

	"Connect and send data"
	[ networkService start.
	conn := server accept.
	networkService
		doSend:
			(SCCPUDT new
				data: aByteArray;
				calledAddr: (SCCPAddress createForSSN: #HLR);
				callingAddr: (SCCPAddress createForSSN: #HLR);
				toMessage) asByteArray
		to: nil
		from: nil ]
		ensure: [ networkService stop.
			server close.
			conn ifNotNil: [ :c | c close ] ]
]

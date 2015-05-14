Class {
	#name : #SCCPNetworkServiceTest,
	#superclass : #TestCase,
	#category : #'NS-Core-Tests'
}

{ #category : #tests }
SCCPNetworkServiceTest >> testSending [
	| hlr hlrAddress vlr vlrAddress gotCalledAddr gotCallingAddr gotData onUnitDataCalled |
	onUnitDataCalled := false.
	hlrAddress := SCCPAddress createWith: SCCPAddress ssnHLR.
	vlrAddress := SCCPAddress createWith: SCCPAddress ssnVLR.
	hlr := SCCPMockNetworkService new
			onUnitData: [:called :calling :data |
				gotCalledAddr := called.
				gotCallingAddr := calling.
				gotData := data.
				onUnitDataCalled := true];
			yourself.
	vlr := SCCPMockNetworkService new
			onUnitData: [:called :calling :data | self fail];
			yourself.
	vlr connectTo: hlr.
	hlr connectTo: vlr.
	
	"Now send a message"
	vlr sendUnitData: #(1 2 3) asByteArray  to:  hlrAddress  from: vlrAddress.
	
	"Wait for the data to be sent"
	self assert: onUnitDataCalled.
	"Weak condition of SSN matching as two SCCP addresses can not be compared yet"
	self
		assert: gotCalledAddr ssn = hlrAddress ssn;
		assert: gotCallingAddr ssn = vlrAddress ssn;
		assert: gotData = #(1 2 3) asByteArray.
	

]

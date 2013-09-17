Class {
	#name : #SCCPNetworkServiceMTP,
	#superclass : #SCCPNetworkService,
	#instVars : [
		'mtpService'
	],
	#category : #'NS-Core'
}

{ #category : #private }
SCCPNetworkServiceMTP >> doSend: aMessage to: aToPoc from: aFromPoc [
	<todo: 'Handle SLS assignment as in Q.711'>
	mtpService transferTo: aToPoc from: aFromPoc sls: 0 data: aMessage.

]

{ #category : #configuration }
SCCPNetworkServiceMTP >> mtp3Service: aService [
	mtpService := aService.
	mtpService onSCCPData: [:mtpMsg | self onData: mtpMsg].
]

{ #category : #private }
SCCPNetworkServiceMTP >> onData: aMtpMsg [
	OsmoDispatcher dispatchBlock: [
		self doReceive: aMtpMsg data].

]

{ #category : #starting }
SCCPNetworkServiceMTP >> start [
	"TODO: This should start the LinkSet which should start the Links which
	should then start the M2UA.. which then should open a SCTP connection.
	Nothing of that is done right now"
	<todo>
]

{ #category : #starting }
SCCPNetworkServiceMTP >> stop [
	"We should stop everything.. but nothing is done yet.. see start"
]

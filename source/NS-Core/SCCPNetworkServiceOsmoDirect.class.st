"
I'm a blocking reader. My parsed SCCP messages will be put into a blocking queue and one or more workers can then fetch the messages. This allows better parallelism in Smalltalk 
"
Class {
	#name : #SCCPNetworkServiceOsmoDirect,
	#superclass : #SCCPNetworkServiceOsmoBase,
	#instVars : [
		'delegate'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> doIpaRecv: aMsg [
	ModuleBoundary runSynchronous: [
		self logManager context: 'payload' value: aMsg.
		self doReceive: aMsg
	]
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> doSend: aMessage to: aToPoc from: aFromPoc [
	delegate nextPut: aMessage with: IPAConstants protocolSCCP.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> initialize [
	super initialize.

	conn := OsmoMessageDirectConnection new.
	delegate := OsmoMessageIPAReadDelegate new.
	delegate onConnect: [:dispatcher | self registerOn: dispatcher].
	conn readDelegate: delegate.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> token: aToken [
	"Forward the token to the connection."
	delegate token: aToken.
]

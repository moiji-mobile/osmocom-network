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
	[
		self logManager context: 'sccp-msg' value: aMsg.
		self doReceive: aMsg
	] on: UnhandledError do: [:err |
		"Ignore errors on SCCP"
		err exception logException: 'SCCP decoding/dispatch' area: #sccp.
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

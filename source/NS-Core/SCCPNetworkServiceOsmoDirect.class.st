"
I'm a blocking reader. My parsed SCCP messages will be put into a blocking queue and one or more workers can then fetch the messages. This allows better parallelism in Smalltalk 
"
Class {
	#name : #SCCPNetworkServiceOsmoDirect,
	#superclass : #SCCPNetworkServiceOsmoBase,
	#instVars : [
		'delegate',
		'queue'
	],
	#category : #'NS-Core'
}

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> doIpaRecv: aMsg [
	self doReceive: aMsg
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> initialize [
	super initialize.

	queue := OsmoBlockingQueue new.
	conn := OsmoMessageDirectConnection new.
	delegate := OsmoMessageIPAReadDelegate new.
	delegate onConnect: [:dispatcher | self registerOn: dispatcher].
	conn readDelegate: delegate.
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> signalUnitData: msg [
	<tcapMethod>

	"Put the message into the queue and block. This is done from within the
	receive process of the OsmoSocket. This means we only read as quickly
	as we can process data. In turn it will lead to window scaling of the TCP
	connection."
	queue nextPut: msg
]

{ #category : #'as yet unclassified' }
SCCPNetworkServiceOsmoDirect >> token: aToken [
	"Forward the token to the connection."
	delegate token: aToken.
]

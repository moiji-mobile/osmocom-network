"
RX is in a process, TX is direct through >>#nextPut:

Exceptions will not propagate throught he nextPut: call but the sending might fail and the socket will the be discarded.
"
Class {
	#name : #OsmoMessageSocketDirect,
	#superclass : #OsmoMessageSocketBase,
	#instVars : [
		'sendMutex'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageSocketDirect >> initialize [
	super initialize.
	sendMutex := Semaphore forMutualExclusion
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketDirect >> nextPut: aMessage [
	sendMutex critical: [
		[
			"We might be in the middle of a re-connect"
			socket ifNotNil: [:tmpSock |
				tmpSock nextPutAllFlush: aMessage].
		] on: UnhandledError do: [:e |
			e logException: 'nextPut failed' area: #osmo.
			errorDelegate onWriteError: self]].
]

{ #category : #'as yet unclassified' }
OsmoMessageSocketDirect >> writeQueue [
	^self
]

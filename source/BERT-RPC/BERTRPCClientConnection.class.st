Class {
	#name : #BERTRPCClientConnection,
	#superclass : #OsmoStreamSocketBase,
	#instVars : [
		'server',
		'writeQueue',
		'maxMessageSize'
	],
	#category : #'BERT-RPC'
}

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> connect [
	"Don't call into the parent"
	writeQueue := SharedQueue new.
]

{ #category : #'wrong-abstraction' }
BERTRPCClientConnection >> createConnection: aHostname port: aPort [
	"We expect new connections"
	^self shouldNotImplement
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> dispatchMessage: aCollection [
	| res |
	aCollection size = 4
		ifFalse: [^self returnError: 'Not a properly encoded BERT request'].
	aCollection first = #call
		ifFalse: [^self returnError: 'Only calls are supported'].
	res := server findModule: aCollection second function: aCollection third.
	res ifNil:
		[^self returnError: 'Module/Function not found' ].
	[
		| bert |
		bert := res first perform: res second withArguments: aCollection fourth asArray.
		self sendAsBERP: {#reply. bert}.
	] on: Error do: [:e |
		self returnError: 'Dispatch failed'.
	]
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> dispatchOne [
	| msg len |
	
	len := (socket next: 4)  asUInt32_t.
	len > maxMessageSize
		ifTrue: [^self error: 'Message is too big' ].
	msg := socket next: len.
	msg size = len
		ifFalse: [^self error: 'Wrong BERP encoding'].
	msg := BERTDecoder decode: msg readStream.
	self dispatchMessage: msg

]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> maxMessageSize: aSize [
	maxMessageSize := aSize.
]

{ #category : #'wrong-abstraction' }
BERTRPCClientConnection >> reconnect [
	"There is no way to re-connect"
	self terminate.
	started := false.
	
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> returnError: aString [ 
	self sendAsBERP:{
		#error.
		{
			#server.  2.
			'BERTError' asByteArray.
			aString asByteArray.
			#().
		}}.
	
	
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> sendAsBERP: aType [
	| encoded |
	encoded := BERTEncoder encode: aType.
	writeQueue nextPut:
		(MessageBuffer new
			putLen32: encoded size;
			putByteArray: encoded;
			yourself) asByteArray.
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> sendOne [
	"TODO: Pill of death!"

	| msg |
	msg := writeQueue next.
	socket ifNotNil: [:s | s nextPutAllFlush: msg]

]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> server: aServer [
	server := aServer
]

{ #category : #'as yet unclassified' }
BERTRPCClientConnection >> socket: aSocket [
	socket := aSocket.
	hostname := 'incoming'.
	port := -1.
]

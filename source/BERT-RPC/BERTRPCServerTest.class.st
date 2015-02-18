"
A BERTRPCServerTest is a test class for testing the behavior of BERTRPCServer
"
Class {
	#name : #BERTRPCServerTest,
	#superclass : #TestCase,
	#instVars : [
		'bertServer'
	],
	#category : #'BERT-RPC-Tests'
}

{ #category : #'as yet unclassified' }
BERTRPCServerTest >> setUp [
	bertServer := BERTRPCServer new.
]

{ #category : #'as yet unclassified' }
BERTRPCServerTest >> testMessageSize [
	bertServer maxMessageSize: 4096.
	self assert: bertServer maxMessageSize equals: 4096.
]

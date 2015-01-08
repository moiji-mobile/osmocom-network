Class {
	#name : #BERTRPCTestClientConnection,
	#superclass : #BERTRPCClientConnection,
	#category : #'BERT-RPC-Tests'
}

{ #category : #'as yet unclassified' }
BERTRPCTestClientConnection >> setUpForTest [
	"Don't call into the parent"
	writeQueue := SharedQueue new.
]

{ #category : #'as yet unclassified' }
BERTRPCTestClientConnection >> writeQueue [
	^writeQueue
]

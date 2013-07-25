"
A MTP3TRAMSGTest is a test class for testing the behavior of MTP3TRAMSG
"
Class {
	#name : #MTP3TRAMSGTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3TRAMSGTest >> testParsing [
	| data stream msg |
	data := #(192 208 199 2 0 23) asByteArray.
	stream := data readStream.
	msg := MTP3MSG parseFrom: stream.
	self assert: stream atEnd.
	self assert: msg class = MTP3TRAMSG.
	self assert: msg toMessage asByteArray = data
]

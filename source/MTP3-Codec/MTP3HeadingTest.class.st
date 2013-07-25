"
A MTP3HeadingTest is a test class for testing the behavior of MTP3Heading
"
Class {
	#name : #MTP3HeadingTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3HeadingTest >> testParsing [
	| data stream field |
	data := #(16r14) asByteArray.
	stream := data readStream.
	field := MTP3Heading parseFrom: stream.
	self assert: stream atEnd.
	self assert: field h0 = MTP3TFMMSG h0.
	self assert: field h1 = MTP3TFPMSG h1.
	self assert: field toMessage asByteArray = data

]

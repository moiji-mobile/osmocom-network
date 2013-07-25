"
A MTP3ServiceIndicatorsTest is a test class for testing the behavior of MTP3ServiceIndicators
"
Class {
	#name : #MTP3ServiceIndicatorsTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3ServiceIndicatorsTest >> testParseFrom [
	| data stream field |
	data := #(16r81) asByteArray.
	stream := data readStream.
	field := MTP3ServiceIndicators parseFrom: stream.
	self assert: stream atEnd.
	self assert: field subServiceField = MTP3ServiceIndicators nationalNetwork.
	self assert: field serviceIndicator 
		    = MTP3ServiceIndicators signallingNetworkTestingAndMaintenance.
	self assert: field toMessage asByteArray = data

]

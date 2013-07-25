"
A MTP3SLTMMSGTest is a test class for testing the behavior of MTP3SLTMMSG
"
Class {
	#name : #MTP3SLTMMSGTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3SLTMMSGTest >> testParsing [
	| data stream msg |
	data := #(16r81 16r02 16r40 16r00 16r00 16r11 16rE0 16r47 16r53 16r4D 16r4D 16r4D 16r53 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) 
		    asByteArray.
	stream := data readStream.
	msg := MTP3MSG parseFrom: stream.
	self assert: stream atEnd.
	self assert: msg class = MTP3SLTMMSG.
	self assert: msg testPattern 
		    = #(16r47 16r53 16r4D 16r4D 16r4D 16r53 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) 
			    asByteArray.
	self assert: msg toMessage asByteArray = data

]

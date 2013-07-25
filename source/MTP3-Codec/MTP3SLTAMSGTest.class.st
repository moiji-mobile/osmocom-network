"
A MTP3SLTAMSGTest is a test class for testing the behavior of MTP3SLTAMSG
"
Class {
	#name : #MTP3SLTAMSGTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3SLTAMSGTest >> testParsing [
	| data stream msg |
	data := #(16r81 16r02 16r40 16r00 16r00 16r21 16rE0 16r47 16r53 16r4D 16r4D 16r4D 16r53 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) 
		    asByteArray.
	stream := data readStream.
	msg := MTP3MSG parseFrom: stream.
	self assert: stream atEnd.
	self assert: msg class = MTP3SLTAMSG.
	self assert: msg testPattern 
		    = #(16r47 16r53 16r4D 16r4D 16r4D 16r53 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) 
			    asByteArray.
	self assert: msg toMessage asByteArray = data

]

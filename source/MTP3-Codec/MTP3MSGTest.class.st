Class {
	#name : #MTP3MSGTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3MSGTest >> testSCCPParsing [
	| data msg |
	data := #(
		16r83 16r5c 16r00 16r07 16r50 16rAA 16rBB 16rCC).
	msg := MTP3MSG parseFrom: data readStream.
	self assert: msg class = MTP3DataMSG.
	self assert: msg toMessage asByteArray = data asByteArray.
]

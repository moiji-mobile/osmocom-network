Class {
	#name : #MTP3LabelTest,
	#superclass : #TestCase,
	#category : #'MTP3-Codec-Tests'
}

{ #category : #'as yet unclassified' }
MTP3LabelTest >> testParseFrom [
	| data stream label |
	data := #(16r01 16r80 16r00 16r00) asByteArray.
	stream := data readStream.
	label := MTP3Label parseFrom: stream.
	self assert: stream atEnd.
	self assert: label dpc = 1.
	self assert: label opc = 2.
	self assert: label slc = 0.
	self assert: label toMessage asByteArray = data

]

{ #category : #'as yet unclassified' }
MTP3LabelTest >> testParseSlc [
	| data stream label |
	data := #(16r5c 16r00 16r07 16r50) asByteArray.
	stream := data readStream.
	label := MTP3Label parseFrom: stream.
	self assert: stream atEnd.
	self assert: label dpc = 92.
	self assert: label opc = 28.
	self assert: label slc = 5.
	self assert: label toMessage asByteArray = data.

]

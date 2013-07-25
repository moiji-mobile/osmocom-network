Class {
	#name : #MTP3DataMSG,
	#superclass : #MTP3BaseMSG,
	#instVars : [
		'data'
	],
	#category : #'MTP3-Codec'
}

{ #category : #creation }
MTP3DataMSG >> data: aByteArray [
	data := aByteArray
]

{ #category : #encoding }
MTP3DataMSG >> writeOn: aBuffer [
	super writeOn: aBuffer.
	aBuffer putByteArray: data
]

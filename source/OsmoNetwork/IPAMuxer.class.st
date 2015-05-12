"
I can multiplex data according to the IPA protocol. You
    will need to give me a Socket or a SharedQueue and I will mux the
    data you provide me with.
"
Class {
	#name : #IPAMuxer,
	#superclass : #Object,
	#instVars : [
		'socket'
	],
	#category : #'OsmoNetwork-IPA'
}

{ #category : #creation }
IPAMuxer class >> initOn: aSocket [
	^(self new)
	    socket: aSocket;
	    yourself

]

{ #category : #encoding }
IPAMuxer >> nextPut: aData with: aStream [
	socket nextPut: (self prepareNext: aData with: aStream)

]

{ #category : #accessing }
IPAMuxer >> prepareNext: aData with: aStream [
	"Write the data onto the stream"

	| msg |
	aData size > 65535 
	    ifTrue: 
		[self logError: 'Too much data' area: #ipa.
		self error: 'Too much data'].
	msg := MessageBuffer new.
	aStream isArray 
	    ifTrue: 
		[msg putLen16: aData size + aStream size - 1.
		msg putByteArray: aStream asByteArray]
	    ifFalse: 
		[msg putLen16: aData size.
		msg putByte: aStream].
	msg putByteArray: aData.
	^msg asByteArray

]

{ #category : #accessing }
IPAMuxer >> socket: aSocket [
	socket := aSocket

]

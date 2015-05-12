"
I know how to demultiplex data from a socket. Give
    me the socket and I read from it and provide you a tuple.
"
Class {
	#name : #IPADemuxer,
	#superclass : #Object,
	#instVars : [
		'socket'
	],
	#category : #IPA
}

{ #category : #creation }
IPADemuxer class >> initOn: aSocket [
	^(self new)
	    socket: aSocket;
	    yourself

]

{ #category : #reading }
IPADemuxer >> next [
	"Return a tuple of stream and bytearray"

	| size stream data |
	size := socket nextUshort swap16.
	stream := socket nextByte.
	data := socket next: size.

	"I know about extensions. Check if this is..."
	stream = IPAConstants protocolOSMO 
	    ifTrue: 
		[stream := Array with: stream with: data first asInteger.
		data := data allButFirst].
	^Array with: stream with: data

]

{ #category : #accessing }
IPADemuxer >> socket: aSocket [
	socket := aSocket

]

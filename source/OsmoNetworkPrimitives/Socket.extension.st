Extension { #name : #Socket }

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
Socket >> ensureReadable [
	^self isValid

]

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
Socket >> isOpen [
	^self isConnected

]

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
Socket >> next [
	| data res |
	data := ByteArray new: 2048.

	">>#waitForData will block forever.. we use some form of polling"
	[self dataAvailable] 
	    whileFalse: [[self waitForDataFor: 10] on: ConnectionTimedOut do: []].
	res := self receiveUDPDataInto: data.
	^OsmoUDPDatagram new
		data: data;
		dataSize: res first;
		address: res second;
		port: res third;
		yourself

]

{ #category : #'*OsmoNetworkPrimitives-Message' }
Socket >> nextByte [
	"Return the next byte in the file, or nil at eof"

	| a |
	a := self next.
	^a isNil ifTrue: [a] ifFalse: [a asInteger]

]

{ #category : #'*OsmoNetworkPrimitives-Message' }
Socket >> nextBytes: n signed: signed [
	"Private - Get an integer out of the next anInteger bytes in the stream"

	| int msb |
	int := 0.
	0 to: n * 8 - 16
	    by: 8
	    do: [:i | int := int + (self nextByte bitShift: i)].
	msb := self nextByte.
	(signed and: [msb > 127]) ifTrue: [msb := msb - 256].
	^int + (msb bitShift: n * 8 - 8)

]

{ #category : #'*OsmoNetworkPrimitives-Message' }
Socket >> nextUshort [
	"Return the next 2 bytes in the byte array, interpreted as a 16 bit unsigned int"
	^self nextBytes: 2 signed: false

]

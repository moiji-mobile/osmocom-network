Extension { #name : #SocketStream }

{ #category : #'*OsmoNetwork-Message' }
SocketStream >> nextByte [
	"Return the next byte in the file, or nil at eof"

	| a |
	a := self next.
	^a isNil ifTrue: [a] ifFalse: [a asInteger]

]

{ #category : #'*OsmoNetwork-Message' }
SocketStream >> nextBytes: n signed: signed [
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

{ #category : #'*OsmoNetwork-Message' }
SocketStream >> nextUshort [
	"Return the next 2 bytes in the byte array, interpreted as a 16 bit unsigned int"
	^self nextBytes: 2 signed: false

]

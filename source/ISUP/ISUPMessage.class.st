"
I am the base class for the ISUP messages
"
Class {
	#name : #ISUPMessage,
	#superclass : #TLVDescriptionContainer,
	#category : #ISUP
}

{ #category : #parsing }
ISUPMessage class >> decodeByteStream: aStream [
	| col cic type |
	cic := (aStream next: 2) shortAt: 1.
	type := (aStream next: 1) at: 1.
	col := self decodeByteStream: aStream type: type.
	^OrderedCollection 
	    with: cic
	    with: type
	    with: col

]

{ #category : #encoding }
ISUPMessage class >> encodeCollection: aCollection [
	| msg type |
	msg := MessageBuffer new.
	type := aCollection at: 2.
	msg put16: (aCollection at: 1).
	msg putByte: type.
	msg putByteArray: (self encodeCollection: (aCollection at: 3) type: type).
	^msg

]

{ #category : #encoding }
ISUPMessage >> createState [
	"Our parsing state. We need to queue the variable fields until all
	 of them have been written."
	^Dictionary newFrom: {'data' -> (WriteStream on: (ByteArray new: 3))}

]

{ #category : #parsing }
ISUPMessage >> parseVariable: aStream with: aClass into: decoded [
	| pos ptr res |
	pos := aStream position.
	ptr := aStream next.
	aStream skip: ptr - 1.
	res := super 
		    parseVariable: aStream
		    with: aClass
		    into: decoded.
	aStream position: pos + 1.
	^res

]

{ #category : #parsing }
ISUPMessage >> prepareOptional: aStream [
	"We are done with the variable section and now get the pointer
	 to the optional part and will move the stream there."

	| pos ptr |
	pos := aStream position.
	ptr := aStream next.
	aStream skip: ptr - 1

]

{ #category : #encoding }
ISUPMessage >> writeVariable: msg with: clazz from: field state: aState [
	"We will write a pointer and then store the data in the state"

	| var_len |
	var_len := self variable size.

	"Write the pointer of where the data will be"
	msg nextPut: (aState at: 'data') size + var_len + 1.

	"Store the data for later"
	super 
	    writeVariable: (aState at: 'data')
	    with: clazz
	    from: field
	    state: nil

]

{ #category : #encoding }
ISUPMessage >> writeVariableEnd: aStream state: aState [
	"Write the optional pointer. TODO: In case of no optional this
	 should be 0"
	aStream nextPut: (aState at: 'data') size + 1.
	aStream nextPutAll: (aState at: 'data') contents

]

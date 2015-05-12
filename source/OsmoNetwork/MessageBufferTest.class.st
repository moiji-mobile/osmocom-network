Class {
	#name : #MessageBufferTest,
	#superclass : #TestCase,
	#category : #'OsmoNetwork-Tests'
}

{ #category : #'as yet unclassified' }
MessageBufferTest >> testAdd [
	| msg1 msg2 msg3 msg_master |
	msg1 := MessageBuffer new.
	msg2 := MessageBuffer new.
	msg3 := MessageBuffer new.
	msg1 putByteArray: #(1 2 3) asByteArray.
	msg2 putByteArray: #(4 5 6) asByteArray.
	msg3 putByteArray: #(7 8 9) asByteArray.
	msg_master := MessageBuffer new.
	msg_master putByteArray: msg1.
	msg_master putByteArray: msg2.
	msg_master putByteArray: msg3.
	self assert: msg_master size = 9.
	self assert: msg_master toByteArray = #(1 2 3 4 5 6 7 8 9) asByteArray.
	self assert: msg_master asByteArray = #(1 2 3 4 5 6 7 8 9) asByteArray

]

{ #category : #'as yet unclassified' }
MessageBufferTest >> testEmptyByteArray [
	| msg |
	msg := MessageBuffer new.
	msg putByteArray: ByteArray new.
	self assert: msg size = 0.
	self assert: msg toByteArray = #() asByteArray

]

{ #category : #'as yet unclassified' }
MessageBufferTest >> testIdentity [
	| msg |
	msg := MessageBuffer new.
	self assert: msg toMessage == msg

]

{ #category : #'as yet unclassified' }
MessageBufferTest >> testPrependByteArray [
	| msg |
	msg := MessageBuffer new.
	msg putByteArray: #(3 4 5) asByteArray.
	msg prependByteArray: #(1 2) asByteArray.
	self assert: msg toByteArray = #(1 2 3 4 5) asByteArray.
	msg := MessageBuffer new.
	msg prependByteArray: #(1 2) asByteArray.
	msg putByteArray: #(3 4 5) asByteArray.
	self assert: msg toByteArray = #(1 2 3 4 5) asByteArray.
	msg := MessageBuffer new.
	msg prependByteArray: #(1 2) asByteArray.
	self assert: msg toByteArray = #(1 2) asByteArray

]

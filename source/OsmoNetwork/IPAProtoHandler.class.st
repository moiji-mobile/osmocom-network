"
I can be registered on an IPADispatcher and will
    handle the IPA protocol. You can subclass me to change the
    behavior.
"
Class {
	#name : #IPAProtoHandler,
	#superclass : #Object,
	#instVars : [
		'token',
		'muxer'
	],
	#classInstVars : [
		'handlers'
	],
	#category : #'OsmoNetwork-IPA'
}

{ #category : #'as yet unclassified' }
IPAProtoHandler class >> handlers [
	^handlers ifNil: 
		[self initialize.
		handlers]

]

{ #category : #creation }
IPAProtoHandler class >> initialize [
	^self initializeHandlers

]

{ #category : #private }
IPAProtoHandler class >> initializeHandlers [
	(handlers := Dictionary new)
	    at: IPAConstants msgPing put: #handlePing:;
	    at: IPAConstants msgPong put: #handlePong:;
	    at: IPAConstants msgIdGet put: #handleIdGet:;
	    at: IPAConstants msgIdAck put: #handleIdAck:

]

{ #category : #private }
IPAProtoHandler >> handleIdAck: aMsg [
	self logDebug: 'ID ACK' area: #ipa

]

{ #category : #authentication }
IPAProtoHandler >> handleIdGet: aMsg [
	| msg |
	msg := MessageBuffer new.
	msg putByte: IPAConstants msgIdResp.
	msg putLen16: token size + 1.
	msg putByte: IPAConstants idtagUnitName.
	msg putByteArray: token asByteArray.
	muxer nextPut: msg asByteArray with: IPAConstants protocolIPA

]

{ #category : #dispatch }
IPAProtoHandler >> handleMsg: aMsg [
	| selector |
	selector := self class handlers at: aMsg first asInteger
		    ifAbsent: 
			[self 
			    logError: 'IPA message not understood ' , aMsg first asInteger asString
			    area: #ipa.
			^false].
	self perform: selector with: aMsg

]

{ #category : #private }
IPAProtoHandler >> handlePing: aMsg [
	muxer nextPut: (ByteArray with: IPAConstants msgPong)
	    with: IPAConstants protocolIPA

]

{ #category : #private }
IPAProtoHandler >> handlePong: aMsg [
	self logDebug: 'PONG' area: #ipa

]

{ #category : #initialize }
IPAProtoHandler >> muxer: aMuxer [
	muxer := aMuxer

]

{ #category : #initialize }
IPAProtoHandler >> registerOn: aDispatcher [
	aDispatcher 
	    addHandler: IPAConstants protocolIPA
	    on: self
	    with: #handleMsg:

]

{ #category : #authentication }
IPAProtoHandler >> token: aToken [
	token := aToken

]

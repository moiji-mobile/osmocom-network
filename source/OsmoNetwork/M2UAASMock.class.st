"
A simple mock
"
Class {
	#name : #M2UAASMock,
	#superclass : #Object,
	#instVars : [
		'socket'
	],
	#category : #'OsmoNetwork-M2UA-Tests'
}

{ #category : #dispatch }
M2UAASMock >> handleAspActive: aMsg [
	| ret |
	ret := (M2UAMSG new)
		    msgClass: M2UAConstants clsASPTM;
		    msgType: M2UAConstants asptmActivAck;
		    yourself.
	socket sendToAsp: ret toMessage asByteArray

]

{ #category : #dispatch }
M2UAASMock >> handleAspDown: aMsg [
	| ret |
	ret := (M2UAMSG new)
		    msgClass: M2UAConstants clsASPSM;
		    msgType: M2UAConstants aspsmDownAck;
		    yourself.
	socket sendToAsp: ret toMessage asByteArray

]

{ #category : #dispatch }
M2UAASMock >> handleAspInactive: aMsg [
	| ret |
	ret := (M2UAMSG new)
		    msgClass: M2UAConstants clsASPTM;
		    msgType: M2UAConstants asptmInactivAck;
		    yourself.
	socket sendToAsp: ret toMessage asByteArray

]

{ #category : #dispatch }
M2UAASMock >> handleAspUp: aMsg [
	| ret |
	ret := (M2UAMSG new)
		    msgClass: M2UAConstants clsASPSM;
		    msgType: M2UAConstants aspsmUpAck;
		    yourself.
	socket sendToAsp: ret toMessage asByteArray

]

{ #category : #'as yet unclassified' }
M2UAASMock >> onData: aData [
	| msg |
	msg := M2UAMSG parseToClass: aData.
	msg dispatchOnAsp: self

]

{ #category : #creation }
M2UAASMock >> socketService: aSocket [
	socket := aSocket

]

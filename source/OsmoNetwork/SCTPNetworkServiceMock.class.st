"
I mock SCTPand directly connect an AS with an ASP.
"
Class {
	#name : #SCTPNetworkServiceMock,
	#superclass : #Object,
	#instVars : [
		'on_connect',
		'on_released',
		'on_data',
		'as',
		'asp'
	],
	#category : #'M2UA-Tests'
}

{ #category : #creation }
SCTPNetworkServiceMock >> applicationServer: anAs [
	as := anAs

]

{ #category : #creation }
SCTPNetworkServiceMock >> applicationServerProcess: anAsp [
	asp := anAsp

]

{ #category : #management }
SCTPNetworkServiceMock >> hostname [
	^'localhost'

]

{ #category : #'as yet unclassified' }
SCTPNetworkServiceMock >> nextPut: aMsg [
	as onData: aMsg

]

{ #category : #'as yet unclassified' }
SCTPNetworkServiceMock >> nextPut: aMsg on: anId [
	as onData: aMsg

]

{ #category : #notification }
SCTPNetworkServiceMock >> onSctpConnect: aBlock [
	on_connect := aBlock

]

{ #category : #creation }
SCTPNetworkServiceMock >> onSctpData: aBlock [
	on_data := aBlock

]

{ #category : #creation }
SCTPNetworkServiceMock >> onSctpReleased: aBlock [
	on_released := aBlock

]

{ #category : #management }
SCTPNetworkServiceMock >> port [
	^0

]

{ #category : #'as yet unclassified' }
SCTPNetworkServiceMock >> sendToAsp: aMsg [
	on_data 
	    value: nil
	    value: nil
	    value: 2
	    value: aMsg

]

{ #category : #management }
SCTPNetworkServiceMock >> start [
	"Nothing"
	on_connect value

]

{ #category : #management }
SCTPNetworkServiceMock >> stop [
	on_released value

]

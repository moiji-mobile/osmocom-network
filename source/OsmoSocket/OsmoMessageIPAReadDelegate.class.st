Class {
	#name : #OsmoMessageIPAReadDelegate,
	#superclass : #OsmoMessageReadDelegate,
	#instVars : [
		'demuxer',
		'muxer',
		'dispatcher',
		'token'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> nextPut: aData with: aConstant [
	muxer nextPut: aData with: aConstant
]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> onNewConnection: aSocket [
	| ipa |
	super onNewConnection: aSocket.

	"Initialize the muxer/demuxer"
	demuxer := IPADemuxer initOn: aSocket.
	muxer := IPAMuxer initOn: aSocket writeQueue.

	"Initialize the dispatcher and proto handler"
 	dispatcher := IPADispatcher new.
	dispatcher initialize.
	
	ipa := IPAProtoHandler new
		    registerOn: dispatcher;
		    muxer: muxer;
		    token: token;
		    yourself.

]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> readOneMessage: aSocket [
	| msg |
	msg := demuxer next.
	dispatcher dispatch: msg first with: msg second
]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> token: aToken [
	token := aToken

]

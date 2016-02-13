Class {
	#name : #OsmoMessageIPAReadDelegate,
	#superclass : #OsmoMessageReadDelegate,
	#instVars : [
		'demuxer',
		'muxer',
		'dispatcher',
		'token',
		'connect_block'
	],
	#category : #OsmoSocket
}

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> nextPut: aData with: aConstant [
	muxer nextPut: aData with: aConstant
]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> onConnect: aBlock [
	"Call the block when the socket is being connected and the dispatcher
	 is set-up. The callback will have the dispatcher as parameter."
	connect_block := aBlock

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

	connect_block ifNotNil: [connect_block value: dispatcher].

]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> readOneMessage: aSocket [
	| msg |
	msg := demuxer next.
	dispatcher dispatch: msg first with: msg second
]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> token [
	^token

]

{ #category : #'as yet unclassified' }
OsmoMessageIPAReadDelegate >> token: aToken [
	token := aToken

]

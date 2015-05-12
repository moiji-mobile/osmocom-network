"
I represent the MTPLevel2 to Level3 Boundary
"
Class {
	#name : #M2UAMTPLevel3Boundary,
	#superclass : #Object,
	#instVars : [
		'applicationServerProcess',
		'on_data_cb',
		'on_in_service',
		'management',
		'on_out_of_service'
	],
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #creation }
M2UAMTPLevel3Boundary class >> on: anAsp [
	^self new
		applicationServerProcess: anAsp;
		yourself
]

{ #category : #creation }
M2UAMTPLevel3Boundary >> applicationServerProcess: anAsp [
	applicationServerProcess := anAsp
]

{ #category : #'as-state-handling' }
M2UAMTPLevel3Boundary >> applicationServerProcessBecameASActive [
	"The ASP is now in the AS-Active state on the ApplicationServer. Bring the MTPL2
	into the right state to be able to start with MTPL3"

	"Maybe another layer should decide this. But time will tell."
	self start
]

{ #category : #'Q.704' }
M2UAMTPLevel3Boundary >> connect [
	"Connect the underlying M2UA/SCTP link if that has
	not happened yet."
	management ifNotNil: [management manage]
]

{ #category : #private }
M2UAMTPLevel3Boundary >> createStatusRequestEmergency [
	^ M2UATag initWith: M2UAConstants tagStateReq data: #(0 0 0 2)
]

{ #category : #mtp3 }
M2UAMTPLevel3Boundary >> data: aBuffer index: anIndex [
	| maup index |
	index := MessageBuffer new putLen32: anIndex; toByteArray.
	maup := M2UAMAUPData newMessage
		addTag: (M2UATag initWith: M2UAConstants tagIdentInt data: index);
		addTag: (M2UATag initWith: M2UAConstants tagData data: aBuffer);
		yourself.
	applicationServerProcess directSend: maup on: 1.
]

{ #category : #'Q.704' }
M2UAMTPLevel3Boundary >> disconnect [
	"Connect the underlying M2UA/SCTP link if that has
	not happened yet."
	management ifNotNil: [management releaseAll]
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> dispatchMtp: aMsg forLink: anIdentInt [
	on_data_cb ifNotNil: [on_data_cb value: aMsg]
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleASPNotify: aType identity: anIdent [
	"The link might now be in AS-active. I am not sure if this is the right place
	to start the link."
	aType = M2UAConstants ntfyKindStateChange
		ifFalse: [^self].
	anIdent = M2UAConstants ntfyStateASActive
		ifTrue: [^self applicationServerProcessBecameASActive].
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleCongestionIndication: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleData: aMsg [
	| identTag dataTag mtp3 |
	identTag := aMsg findTag: M2UAConstants tagIdentInt.
	dataTag := aMsg findTag: M2UAConstants tagData.
	mtp3 := MTP3MSG parseFrom: dataTag data readStream.
	self dispatchMtp: mtp3 forLink: identTag data
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleDataAck: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleEstablishConfirm: aMsg [
	"Inform someone..."
	on_in_service ifNotNil: [on_in_service value].
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleReleaseConfirm: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleReleaseIndication: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleReleaseRequest: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleRetrievalComplete: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleRetrievalConfirm: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleRetrievalIndication: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleRetrievalRequest: aMsg [
	self notYetImplemented
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleStateConfirm: aMsg [ 
	"Assume what we asked for was granted. Continue"
	self sendEstablishRequest
]

{ #category : #dispatching }
M2UAMTPLevel3Boundary >> handleStateIndication: aMsg [
	self notYetImplemented
]

{ #category : #creation }
M2UAMTPLevel3Boundary >> management: aManagement [
	management := aManagement
]

{ #category : #mtp3 }
M2UAMTPLevel3Boundary >> onData: aBlock [
	on_data_cb := aBlock
]

{ #category : #mtp3 }
M2UAMTPLevel3Boundary >> onInService: aBlock [
	on_in_service := aBlock
]

{ #category : #mtp3 }
M2UAMTPLevel3Boundary >> onOutOfService: aBlock [
	on_out_of_service := aBlock.
]

{ #category : #primitive }
M2UAMTPLevel3Boundary >> sendEmergencyAlignment [
	| msg |

	msg := M2UAMSG new
				class: M2UAConstants clsMAUP;
				msgType: M2UAConstants maupStateReq;
				addTag: self createStatusRequestEmergency;
				yourself.
	applicationServerProcess directSend: msg on: 1.
]

{ #category : #primitive }
M2UAMTPLevel3Boundary >> sendEstablishRequest [
	| msg |
	"This is as 5.3.1 of RFC 3331"
	
	msg := (M2UAMSG new)
		class: M2UAConstants clsMAUP;
		msgType: M2UAConstants maupEstReq;
		yourself.
	applicationServerProcess directSend: msg on: 1.
]

{ #category : #primitive }
M2UAMTPLevel3Boundary >> start [
	self sendEmergencyAlignment
]

{ #category : #'Q.704' }
M2UAMTPLevel3Boundary >> stop [
	"Difference between terminal and other parts.. we don't have that right now"
	self disconnect
]

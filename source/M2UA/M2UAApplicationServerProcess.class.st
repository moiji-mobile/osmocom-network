"
I am a M2UA Application Server Process.

I have an internal state machine and a state and will be used by the
M2UA Layer. I am written for the usage in a Media Gateway Controller
and will also keep information about the Application Server itself.

If I need to be used on a Signalling Gateway (SG) I will need a dedicated
M2UA Application Server class and state machine.

I can currently only manage a single interface. The specification allows
a single ASP to send one ASPActive for one interface at a time.
"
Class {
	#name : #M2UAApplicationServerProcess,
	#superclass : #Object,
	#instVars : [
		'socket',
		'asp_active_block',
		'asp_down_block',
		'asp_inactive_block',
		'asp_up_block',
		'error_block',
		'notify_block',
		'sctp_confirm_block',
		'sctp_released_block',
		'sctp_restarted_block',
		'sctp_status_block',
		'established',
		'state',
		't_ack',
		'lastMsg',
		'on_state_change',
		'as_state',
		'mtpBoundary'
	],
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcess class >> initWith: aService [
	^(self new)
	    socketService: aService;
	    yourself

]

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcess class >> new [
	^(super new)
	    initialize;
	    yourself

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> aspActive [
	"M-ASP_ACTIVE request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to send an ASP ACTIVE message to the SGP."

	| msg |
	self checkNextState: M2UAAspStateActive.
	msg := (M2UAMSG new)
		    class: M2UAConstants clsASPTM;
		    msgType: M2UAConstants asptmActiv;
		    addTag: self createIdentIntTag;
		    addTag: self createInfoTag;
		    yourself.
	self send: msg on: 1.

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> aspDown [
	"M-ASP_DOWN request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to stop its operation and send an ASP DOWN
	 message to the SGP."

	| msg |
	self checkNextState: M2UAAspStateDown.
	msg := (M2UAMSG new)
		    class: M2UAConstants clsASPSM;
		    msgType: M2UAConstants aspsmDown;
		    addTag: self createAspIdentTag;
		    addTag: self createInfoTag;
		    yourself.
	self send: msg

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> aspInactive [
	"M-ASP_INACTIVE request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to send an ASP INACTIVE message to the SGP."

	| msg |
	self checkNextState: M2UAAspStateInactive.
	msg := (M2UAMSG new)
		    class: M2UAConstants clsASPTM;
		    msgType: M2UAConstants asptmInactiv;
		    addTag: self createIdentIntTag;
		    addTag: self createInfoTag;
		    yourself.
	self send: msg on: 1.

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> aspUp [
	"M-ASP_UP request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to start its operation and send an ASP UP
	 message to the SGP."

	| msg |
	self checkNextState: M2UAAspStateInactive.
	msg := (M2UAMSG new)
		    class: M2UAConstants clsASPSM;
		    msgType: M2UAConstants aspsmUp;
		    addTag: self createAspIdentTag;
		    addTag: self createInfoTag;
		    yourself.
	self send: msg

]

{ #category : #private }
M2UAApplicationServerProcess >> callNotification: aBlock [
	"Inform the generic method first, then all the others"
	on_state_change ifNotNil: [on_state_change value].
	aBlock ifNotNil: [aBlock value]

]

{ #category : #private }
M2UAApplicationServerProcess >> checkNextState: nextState [
	"Check if nextState and state are compatible and if not
	 throw an exception. TODO:"
	self state = nextState 
	    ifTrue: 
		[^self error: ('M2UA ASP already in state <1p>' expandMacrosWith: state)].
	(self state nextPossibleStates includes: nextState) 
	    ifFalse: 
		[^self error: ('M2UA ASP illegal state transition from <1p> to <2p>.' 
			    expandMacrosWith: state
			    with: nextState)]

]

{ #category : #'m2ua-tags' }
M2UAApplicationServerProcess >> createAspIdentTag [
	^M2UATag initWith: M2UAConstants tagAspIdent data: #(1 2 3 4)

]

{ #category : #'m2ua-tags' }
M2UAApplicationServerProcess >> createIdentIntTag [
	^M2UATag initWith: M2UAConstants tagIdentInt data: #(0 0 0 0)

]

{ #category : #'m2ua-tags' }
M2UAApplicationServerProcess >> createInfoTag [
	^M2UATag initWith: M2UAConstants tagInfo
	    data: 'Hello from Smalltalk' asByteArray

]

{ #category : #'Primitives-LayerManagement-LinkKey' }
M2UAApplicationServerProcess >> deregisterLinkKey [
	"M-LINK_KEY_DEREG Request
	 Direction:  LM -> M2UA
	 Purpose:  LM requests ASP to de-register Link Key with SG by sending
	 DEREG REQ message."
	self notYetImplemented

]

{ #category : #private }
M2UAApplicationServerProcess >> directSend: aMsg on: aStream [
	"No T(ACK) because this is a MAUP message and such... RFC3331 does not appear
	to have a timeout for that."
	socket nextPut: aMsg toMessage asByteArray on: aStream

]

{ #category : #private }
M2UAApplicationServerProcess >> dispatchData: aByteArray [
	| msg |
	msg := M2UAMSG parseToClass: aByteArray.
	msg dispatchOnAsp: self

]

{ #category : #private }
M2UAApplicationServerProcess >> dispatchNotification: aBlock [
	aBlock value

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleAspActiveAck: aMsg [
	t_ack cancel.
	self moveToState: M2UAAspStateActive.
	self callNotification: asp_active_block

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleAspDownAck: aMsg [
	t_ack cancel.
	as_state := nil.
	self moveToState: M2UAAspStateDown.
	self callNotification: asp_down_block

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleAspInactiveAck: aMsg [
	t_ack cancel.
	as_state := nil.
	self moveToState: M2UAAspStateInactive.
	self callNotification: asp_inactive_block

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleAspUpAck: aMsg [
	t_ack cancel.
	self moveToState: M2UAAspStateInactive.
	self callNotification: asp_inactive_block

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleError: aMsg [
	"Cancel pending operations.. because something went wrong"
	t_ack cancel.
	error_block ifNotNil: [error_block value: aMsg]

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleNotify: aMsg [
	"Extract the status"

	| tag type ident |
	tag := aMsg findTag: M2UAConstants tagStatus.
	tag ifNil: [^self].
	type := (tag data ushortAt: 1) swap16.
	ident := (tag data ushortAt: 3) swap16.
	type = M2UAConstants ntfyKindStateChange ifTrue: [as_state := ident].

	"Inform our user about it"
	mtpBoundary handleASPNotify: type identity: ident.
	notify_block ifNotNil: [notify_block value: type value: ident]

]

{ #category : #dispatch }
M2UAApplicationServerProcess >> handleUnknownMessage: aMsg [
	"We got something we don't know. ignore it for now."

]

{ #category : #configuration }
M2UAApplicationServerProcess >> hostname: aHostname port: aPort [
	"Select the SCTP hostname/port for the SG to connect to"
	socket
	    hostname: aHostname;
	    port: aPort

]

{ #category : #creation }
M2UAApplicationServerProcess >> initialize [
	state := M2UAAspStateDown.
	mtpBoundary := M2UAMTPLevel3Boundary on: self.

]

{ #category : #private }
M2UAApplicationServerProcess >> internalReset [
	self socketService: socket

]

{ #category : #status }
M2UAApplicationServerProcess >> isASActive [
	^as_state = M2UAConstants ntfyStateASActive

]

{ #category : #status }
M2UAApplicationServerProcess >> isASInactive [
	^as_state = M2UAConstants ntfyStateASInactive

]

{ #category : #status }
M2UAApplicationServerProcess >> isASPending [
	^as_state = M2UAConstants ntfyStateASPending

]

{ #category : #private }
M2UAApplicationServerProcess >> moveToState: newState [
	((state nextPossibleStates includes: newState) or: [state = newState]) 
	    ifFalse: 
		[^self error: ('M2UA ASP Illegal state transition from <1p> to <2p>' 
			    expandMacrosWith: state
			    with: newState)].

	"TODO: general on entry, on exit"
	state := newState

]

{ #category : #'MTP-Level2-Level3-Boundary' }
M2UAApplicationServerProcess >> mtpLevel3Boundary [
	^mtpBoundary
]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> onAspActive: aBlock [
	"M-ASP_ACTIVE confirm
	 Direction: M2UA -> LM
	 Purpose: ASP reports that is has received an ASP ACTIVE
	 Acknowledgment message from the SGP."
	asp_active_block := aBlock

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> onAspDown: aBlock [
	"M-ASP_DOWN confirm
	 Direction: M2UA -> LM
	 Purpose: ASP reports that is has received an ASP DOWN Acknowledgment
	 message from the SGP."
	asp_down_block := aBlock

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> onAspInactive: aBlock [
	"M-ASP_INACTIVE confirm
	 Direction: M2UA -> LM
	 Purpose: ASP reports that is has received an ASP INACTIVE
	 Acknowledgment message from the SGP."
	asp_inactive_block := aBlock

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> onAspUp: aBlock [
	"M-ASP_UP confirm
	 Direction: M2UA -> LM
	 Purpose: ASP reports that it has received an ASP UP Acknowledgment
	 message from the SGP."
	asp_up_block := aBlock

]

{ #category : #'Primitives-LayerManagement' }
M2UAApplicationServerProcess >> onError: aBlock [
	"M-ERROR indication
	 Direction: M2UA -> LM
	 Purpose: ASP or SGP reports that it has received an ERROR
	 message from its peer."
	error_block := aBlock

]

{ #category : #'Primitives-LayerManagement-LinkKey' }
M2UAApplicationServerProcess >> onLinkKeyDeregistered: aBlock [
	"M-LINK_KEY_DEREG Confirm
	 Direction:  M2UA -> LM
	 Purpose:  ASP reports to LM that it has successfully received a
	 DEREG RSP message from SG."
	self notYetImplemented

]

{ #category : #'Primitives-LayerManagement-LinkKey' }
M2UAApplicationServerProcess >> onLinkKeyRegistered: aBlock [
	"M-LINK_KEY_REG Confirm
	 Direction:   M2UA -> LM
	 Purpose: ASP reports to LM that it has successfully received a REG
	 RSP message from SG."
	self notYetImplemented

]

{ #category : #'Primitives-LayerManagement' }
M2UAApplicationServerProcess >> onNotify: aBlock [
	"M-NOTIFY indication
	 Direction: M2UA -> LM
	 Purpose: ASP reports that it has received a NOTIFY message
	 from its peer."
	notify_block := aBlock

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> onSctpEstablished: aBlock [
	"M-SCTP_ESTABLISH confirm
	 Direction: M2UA -> LM
	 Purpose: ASP confirms to LM that it has established an SCTP association with an SGP."
	sctp_confirm_block := aBlock

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> onSctpReleased: aBlock [
	"M-SCTP_RELEASE confirm
	 Direction: M2UA -> LM
	 Purpose: ASP confirms to LM that it has released SCTP association with SGP."
	sctp_released_block := aBlock

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> onSctpRestarted: aBlock [
	"M-SCTP_RELEASE indication
	 Direction: M2UA -> LM
	 Purpose: SGP informs LM that ASP has released an SCTP association."
	sctp_restarted_block := aBlock

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> onSctpStatus: aBlock [
	"M-SCTP_STATUS indication
	 Direction: M2UA -> LM
	 Purpose: M2UA reports status of SCTP association."
	sctp_status_block := aBlock

]

{ #category : #'Primitives-LayerManagemennt-ASP' }
M2UAApplicationServerProcess >> onStateChange: aBlock [
	"A generic callback for all state changes"
	on_state_change := aBlock

]

{ #category : #'Primitives-LayerManagement-LinkKey' }
M2UAApplicationServerProcess >> registerLinkKey [
	"M-LINK_KEY_REG Request
	 Direction:  LM -> M2UA
	 Purpose: LM requests ASP to register Link Key with SG by sending REG
	 REQ message."
	self notYetImplemented

]

{ #category : #private }
M2UAApplicationServerProcess >> sctpConnected [
	"The connect was issued."

	| wasEstablished |
	wasEstablished := established.
	established := true.
	state := M2UAAspStateDown.
	t_ack ifNotNil: [t_ack cancel].
	wasEstablished = true 
	    ifTrue: [sctp_confirm_block ifNotNil: [sctp_confirm_block value]]
	    ifFalse: [sctp_restarted_block ifNotNil: [sctp_restarted_block value]]

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> sctpEstablish [
	"M-SCTP_ESTABLISH request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to establish an SCTP association with an SGP."
	established := false.
	socket stop.
	socket start

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> sctpRelease [
	"M-SCTP_RELEASE request
	 Direction: LM -> M2UA
	 Purpose: LM requests ASP to release an SCTP association with SGP."
	established := false.
	socket stop.
	t_ack ifNotNil: [t_ack cancel]

]

{ #category : #private }
M2UAApplicationServerProcess >> sctpReleased [
	"The SCTP connection has been released."
	self moveToState: M2UAAspStateDown.
	established = true ifFalse: [^self].
	sctp_released_block ifNotNil: [sctp_released_block value]

]

{ #category : #'Primitives-LayerManagement-SCTP' }
M2UAApplicationServerProcess >> sctpStatusRequest [
	"M-SCTP_STATUS request
	 Direction: LM -> M2UA
	 Purpose: LM requests M2UA to report status of SCTP association."
	self notYetImplemented

]

{ #category : #private }
M2UAApplicationServerProcess >> send: aMsg [
	^self send: aMsg on: 0.

]

{ #category : #private }
M2UAApplicationServerProcess >> send: aMsg on: aStream [
	"Forget about what we did before"
	t_ack ifNotNil: [t_ack cancel].
	t_ack := TimerScheduler instance scheduleInSeconds: 2
		    block: 
			["Re-send the message"

			self logNotice: ('<1p>:<2p> Sending message has timed out' 
				    expandMacrosWith: socket hostname
				    with: socket port)
			    area: #m2ua.
			self send: aMsg on: aStream].
	socket nextPut: aMsg toMessage asByteArray on: aStream

]

{ #category : #creation }
M2UAApplicationServerProcess >> socketService: aService [
	socket := aService.
	socket
	    onSctpConnect: [self sctpConnected];
	    onSctpReleased: [self sctpReleased];
	    onSctpData: 
		    [:stream :assoc :ppid :data | 
		    ppid = 2 
			ifFalse: 
			    [^self logNotice: 'M2UAApplicationServerProcess expecting PPID 2.'
				area: #m2ua].
		    self dispatchData: data]

]

{ #category : #accessing }
M2UAApplicationServerProcess >> state [
	^state

]

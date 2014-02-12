"
I represent a MTP Level3 Link. I belong to a linkset
and Iam using a MTP Level2 class or a link adaption
like the M2UA code.

I will handle Signalling Link Tests Management myself and forward data to the linkset I belong to.

I am also imposing as the Signalling message handling Message distribution (HMDT), the Signalling message handling Message routing (HMRT) and the Managment system (MHMT)
"
Class {
	#name : #MTPLevel3Link,
	#superclass : #Object,
	#instVars : [
		'linkSet',
		'boundary',
		'state',
		'signallingLinkTestControl',
		'signallingLinkActivityControl',
		'blocked',
		'lsla',
		'signallingLinkActivation',
		'signallingLinkDeactivation',
		'trafficLinkAvailabilityControl'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #'as yet unclassified' }
MTPLevel3Link class >> new [
	^super new
		initialize;
		yourself
]

{ #category : #private }
MTPLevel3Link >> boundary [
	^ boundary
]

{ #category : #dispatch }
MTPLevel3Link >> dispatchInService [
	"The underlying link is back. Tell the linkSet which might starts the link test procedure"
	"TODO: this probably goes to the LSAC first"
	self flag: #todo.
	state := #LinkInService.
	linkSet linkInService: self.
]

{ #category : #dispatch }
MTPLevel3Link >> dispatchMessage: aMsg [
	linkSet mtp3Service hmdc receivedMessage: aMsg link: self.
]

{ #category : #dispatch }
MTPLevel3Link >> dispatchOutOfService [
	"The underlying link is gone.."
	state := #LinkOutOfService.
	self lsac outOfService.
]

{ #category : #creation }
MTPLevel3Link >> initialize [
	super initialize.
	signallingLinkTestControl := MTP3SignallingLinkTestControl initWith: self.
	signallingLinkActivityControl := MTP3SignallingLinkActivityControl initWith: self.
	blocked := false.
]

{ #category : #state }
MTPLevel3Link >> isBlocked [
	^blocked
]

{ #category : #private }
MTPLevel3Link >> linkSet [
	^ linkSet
]

{ #category : #linkset }
MTPLevel3Link >> linkSet: aSet [
	linkSet := aSet
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> lsac [
	^self signallingLinkActivityControl
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> lsla [
	^signallingLinkActivation ifNil: [signallingLinkActivation := MTP3SignallingLinkActivation initWith: self]
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> lsld [
	^signallingLinkDeactivation ifNil: [signallingLinkDeactivation := MTP3SignallingLinkDeactivation initWith: self]
]

{ #category : #internal }
MTPLevel3Link >> mtpLevel3Boundary [
	^boundary
]

{ #category : #'mtp2-boundary' }
MTPLevel3Link >> mtpLevel3Boundary: aBoundary [
	boundary := aBoundary.
	boundary onData: [:msg | self dispatchMessage: msg].
	"TODO: this is a bit early. It should come from the SLTC to the LSAC... to the linkset"
	boundary
		onInService: [self dispatchInService];
		onOutOfService: [self dispatchOutOfService].

]

{ #category : #accessing }
MTPLevel3Link >> physicalNumber [
	self flag: #todo. "TODO: Ask the LinkSet for our SLC..."
	^0
]

{ #category : #sending }
MTPLevel3Link >> send: aMsg [
	self boundary data: aMsg index: 0.
]

{ #category : #private }
MTPLevel3Link >> signallingLinkActivityControl [
	^signallingLinkActivityControl
]

{ #category : #'state-machines' }
MTPLevel3Link >> signallingLinkTestControl [
	^signallingLinkTestControl
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> sltc [
	^signallingLinkTestControl
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> tlac [
	^self trafficLinkActivityControl
]

{ #category : #'mtp3-machines' }
MTPLevel3Link >> trafficLinkActivityControl [
	^trafficLinkAvailabilityControl ifNil: [trafficLinkAvailabilityControl := MTP3TrafficLinkAvailabilityControl initWith: self]
]

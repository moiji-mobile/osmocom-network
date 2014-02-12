"
I represent the primitives of Q.701 for MTP3 and I provide the central object for Q.704

I will have multiple LinkSets that have multiple
Links and I will implement the support function
that the different machines can find each
other and I will help with routing. Maybe I will
be split into two classes
"
Class {
	#name : #MTP3Service,
	#superclass : #Object,
	#instVars : [
		'on_pause',
		'on_resume',
		'on_status',
		'linkSets',
		'on_sccp',
		'tsfc',
		'hmcg',
		'hdmc',
		'hdmt',
		'hmrt',
		'mgmt',
		'rtpc',
		'srm',
		'on_discard',
		'stm'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #'as yet unclassified' }
MTP3Service class >> new [
	^super new
		initialize;
		yourself
]

{ #category : #'as yet unclassified' }
MTP3Service class >> on: aLinkSet [
	^self new
		addLinkSet: aLinkSet;
		yourself
]

{ #category : #linksets }
MTP3Service >> addLinkSet: aSet [
	^self linkSets add: aSet
]

{ #category : #'mtp3-machines' }
MTP3Service >> discardMessage: aMsg [
	"Here so we can see what is discarded"
	on_discard ifNotNil: [on_discard value: aMsg].
]

{ #category : #'mtp3-routing' }
MTP3Service >> dpcRoutable: aMsg [
	self flag: #todo. "Routing is not implemented at all. A MTP3 subclass should implemen routing based on a collection of LinkSets."
	
	"Right now check if there is any direct route"

	^linkSets anySatisfy: [:each |
			(each dpc = aMsg label dpc) and: [each llsc isActive] ].
]

{ #category : #'mtp3-routing' }
MTP3Service >> dpcSpRestarts: aDpc [ 
	self notYetImplemented.
	^false
]

{ #category : #'mtp3-machines' }
MTP3Service >> hmcg [
	^hmcg ifNil: [hmcg := MTP3HandlingMessageCongestion initWith: self]
]

{ #category : #'mtp3-machines' }
MTP3Service >> hmdc [
	^hdmc ifNil: [hdmc := MTP3HandlingMessageDiscrimination initWith: self].
]

{ #category : #'mtp3-machines' }
MTP3Service >> hmdt [
	^hdmt ifNil: [hdmt := MTP3HandlingMessageDistribution initWith: self].
]

{ #category : #'mtp3-machines' }
MTP3Service >> hmrt [
	^hmrt ifNil: [hmrt := MTP3HandlingMessageRouting initWith: self]
]

{ #category : #private }
MTP3Service >> initialize [
	super initialize.
	linkSets := OrderedCollection new.
]

{ #category : #linksets }
MTP3Service >> linkSets [
	^linkSets
]

{ #category : #'mtp3-machines' }
MTP3Service >> mgmt [
	^mgmt ifNil: [ mgmt := MTP3ManagementSystem initWith: self ]
]

{ #category : #'as yet unclassified' }
MTP3Service >> onMessageDiscarded: aBlock [
	on_discard := aBlock
]

{ #category : #indication }
MTP3Service >> onPause: aBlock [
	"Called with DPC"
	on_pause := aBlock

]

{ #category : #indication }
MTP3Service >> onResume: aBlock [
	"Called with affected LinkSet"
	on_resume := aBlock

]

{ #category : #indication }
MTP3Service >> onSCCPData: aBlock [
	"a Dictionary with opc dpc sls sio data is sent"
	on_sccp := aBlock
]

{ #category : #indication }
MTP3Service >> onStatus: aBlock [
	"Called with the Affected DPC"
	on_status := aBlock

]

{ #category : #'mtp3-routing' }
MTP3Service >> originatesFromSP: aMsg [
	^aMsg opc = self dpc.
]

{ #category : #'mtp3-routing' }
MTP3Service >> originatesFromSP: aMsg link: aLink [
	"In case all linksets are down we can not route.."
	aLink ifNil: [^true].

	^aMsg label opc = aLink linkSet dpc.
]

{ #category : #'mtp3-machines' }
MTP3Service >> rtpc [
	^rtpc ifNil: [rtpc := MTP3TransferProhibitedControl initWith: self]
]

{ #category : #private }
MTP3Service >> signalData: aMsg [
	"We got some data and can send a transfer indication. Not very object orientated but okay"
	aMsg service isSccp
		ifTrue: [
			^on_sccp ifNotNil: [on_sccp value: aMsg]
		].

	"Unknown data type"
	self logNotice: 'Unhandled service' area: #mtp3.
]

{ #category : #private }
MTP3Service >> signalResume: aLinkSet [
	on_resume ifNotNil: [on_resume value: aLinkSet].
]

{ #category : #'mtp3-machines' }
MTP3Service >> sltc [
	self shouldBeImplemented.
]

{ #category : #'mtp3-machines' }
MTP3Service >> srm [
	^srm ifNil: [srm := MTP3SignallingRouteManagement initWith: self]
]

{ #category : #'mtp3-machines' }
MTP3Service >> stm [
	^stm ifNil: [stm := MTP3SignallingTrafficManagement initWith: self]
]

{ #category : #request }
MTP3Service >> transferTo: dpc from: opc sls: aSls data: aMsg [
	| msg |
	"According to Q.704 I should have:
	    * OPC
	    * DPC
	    * SLS
	    * SIO
	    * Data"
	"TODO: Select route... look at the specification again..."
	msg := MTP3DataMSG new
				service: MTP3ServiceIndicators createIndicatorForSCCP;
				label: (MTP3Label new dpc: dpc; opc: opc; slc: aSls; yourself);
				data: aMsg;
				yourself.
	self hmrt transferRequest: msg.
	 

]

{ #category : #'mtp3-machines' }
MTP3Service >> tsfc [
	"Traffic "
	^tsfc ifNil: [ tsfc := MTP3TrafficSignallingFlowControl initWith: self ]
]

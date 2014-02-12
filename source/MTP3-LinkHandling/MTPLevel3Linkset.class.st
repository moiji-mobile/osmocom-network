"
I represent a MTP Level3 LinkSet.

I have a list of states.



NOTES:

* LSLA is not properly implemented. This means no restoration and no emergency link..
* No SLC/SLS handling yet.. there should be a physical number assigned to each active...
* No load sharing yet...
* All of the STM/STR is not implemented
* No changeover support
* Routing is disabled right now.
* Sending does not go through the HMRT yet...
"
Class {
	#name : #MTPLevel3Linkset,
	#superclass : #Object,
	#instVars : [
		'links',
		'dpc',
		'opc',
		'state',
		't21',
		'mtp3Service',
		'llsc'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #creation }
MTPLevel3Linkset class >> new [
	^super new
		initialize;
		yourself
]

{ #category : #'as yet unclassified' }
MTPLevel3Linkset >> addLink: aLink [
	self links add: aLink.
	aLink linkSet: self.
]

{ #category : #'link-handling' }
MTPLevel3Linkset >> allNonBlockedLinks [
	^self links select: [:each | each isBlocked not].
]

{ #category : #'mtp3-hdmt' }
MTPLevel3Linkset >> dispatchTRA: aMsg [
	"We get a traffic restart allowed..."
	self flag: #todo. "Not called anymore. The STM needs to handle this..."
	self t21OrTraExpired
]

{ #category : #accessing }
MTPLevel3Linkset >> dpc [
	^dpc
]

{ #category : #creation }
MTPLevel3Linkset >> dpc: aDpc [
	dpc := aDpc
]

{ #category : #creation }
MTPLevel3Linkset >> initialize [
	super initialize.
	mtp3Service := MTP3Service on: self.
]

{ #category : #'link-handling' }
MTPLevel3Linkset >> linkInService: aLink [
	| was_up |
	"Check Q.704 Diagram 9.7.2 for details. We just
	assume that there is only one adjacent link."

	"TODO: introduce a state class and dispatch..."
	was_up := state = #LinkSetUp.

	"Remember that something is active now..."
	state := #LinkSetUp.

	"TODO: somebody else should send it"
	aLink lsac linkInService.

	was_up ifFalse: [
		self mtpRestartingProcedureStart.
	].
]

{ #category : #'link-handling' }
MTPLevel3Linkset >> linkResumed: aLink [
	state := #LinkSetUp.
	aLink startLinkTest.
]

{ #category : #'as yet unclassified' }
MTPLevel3Linkset >> links [
	^links ifNil: [links := OrderedCollection new]
]

{ #category : #'mtp3-machines' }
MTPLevel3Linkset >> llsc [
	^llsc ifNil: [llsc  := MTP3SignallingLinkSetControl initWith: self]
]

{ #category : #accessing }
MTPLevel3Linkset >> mtp3Service [
	^mtp3Service
]

{ #category : #'mtp3-restarting' }
MTPLevel3Linkset >> mtpRestartingProcedureStart [
	t21 := TimerScheduler instance scheduleInSeconds: 65 block: [self t21OrTraExpired]
]

{ #category : #accessing }
MTPLevel3Linkset >> opc [
	^opc
]

{ #category : #creation }
MTPLevel3Linkset >> opc: aOpc [
	opc := aOpc
]

{ #category : #internal }
MTPLevel3Linkset >> send: aMsg [
	"This should not be called anymore"
	self halt.
	self flag: #todo. "Send through the HMRT but probably already at the MTP3Service"
	self links first send: aMsg
]

{ #category : #accessing }
MTPLevel3Linkset >> service [
	^MTP3ServiceIndicators new
		subServiceField: MTP3ServiceIndicators reservedNationalUse;
		serviceIndicator: MTP3ServiceIndicators signallingNetworkTestingAndMaintenance;
		yourself
]

{ #category : #'mtp3-data' }
MTPLevel3Linkset >> signalData: aMsg [
	"This is some data. It can be SCCP, ISUP or TUP..."
	mtp3Service singalData: aMsg.
]

{ #category : #llsc }
MTPLevel3Linkset >> start [
	self llsc activateLinkSet
]

{ #category : #llsc }
MTPLevel3Linkset >> stop [
	self llsc deactivateLinkset
]

{ #category : #'mtp3-restarting' }
MTPLevel3Linkset >> t21OrTraExpired [
	t21 ifNotNil: [t21 cancel].
	mtp3Service signalResume: self.
]

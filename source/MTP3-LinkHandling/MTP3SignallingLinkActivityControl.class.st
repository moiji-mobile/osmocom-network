"
I implement a LSAC machine. Right now I don''t.


Check Q.704 for LSAC
"
Class {
	#name : #MTP3SignallingLinkActivityControl,
	#superclass : #MTP3LinkHandlingBase,
	#instVars : [
		'state',
		'firstFailure',
		'activiationRestorationUnsuccessful',
		'emergency'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #states }
MTP3SignallingLinkActivityControl class >> stateActivatingAndRestoring [
	^ #ActivatingAndRestoring
]

{ #category : #states }
MTP3SignallingLinkActivityControl class >> stateActive [
	^#Active
]

{ #category : #states }
MTP3SignallingLinkActivityControl class >> stateInactive [
	^#Inactive
]

{ #category : #states }
MTP3SignallingLinkActivityControl class >> stateWait [
	^#Wait
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> STMReady [
	"TCOC -> LSAC"
	link linkSet llsc linkFailed: link.
	link mtpLevel3Boundary stop.
	link lsld deactivateLink.
	link linkSet llsc linkInactive: link.
	self setState: self class stateInactive
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> activateLink [
	"LLSC -> LSAC or MGMT -> LSAC"
	self isInactive ifFalse: [^self].

	link lsla startActivation.
	self markActivation.
	self setState: self class stateActivatingAndRestoring.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> activationNotPossible [
	"LSLA -> LSAC"
	self isActivatingAndRestoring ifFalse: [^false].

	link lsld deactivateLink.
	self isActivatingAndRestoringUnsuccessful
		ifTrue: [link linkSet lsac activateAnotherLink: link].
	self setState: self class stateInactive.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> activationUnsuccesful [
	"LSLA -> LSAC (or from restoriationUnsuccessful"
	
	self isActivatingAndRestoring ifFalse: [^self].
	
	self isActivationRestorationUnsuccessful
		ifFalse: [
			activiationRestorationUnsuccessful := true.
			link llsc activateAnotherLink].

]

{ #category : #support }
MTP3SignallingLinkActivityControl >> cancelActivationRestorationUnsuccessful [
	activiationRestorationUnsuccessful := false.
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> cancelFirstFailure [
	firstFailure := false.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> changeOverOrderReceived [
	"TLAC -> LSAC"
	self flag: #todo. "Changeover is not implemented"
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> continue [
	"TLAC -> LSAC"
	link mtpLevel3Boundary continue.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> dataLink [
	"LSDA->LSAC"
	self activateLink
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> deactivateActiveLink [
	"LLSC->LSAC and MGMT->LSAC"
	
	"Re-order states to deal with direct changes"
	self setState: self class stateWait.
	
	link tlac signallingLinkFailed.
	"We are now waiting for the STM ready from the TCOC"
	
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> deactivateLink [
	"LLSC -> LSAC or LSTA -> LSAC or MGMT -> LSAC"
	self isActive
		ifTrue: [self deactivateActiveLink]
		ifFalse: [self stopLink].
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> deactivateLinkFromManagement [
	"MGMT -> LSAC"
	
	"If active for MGMT one"
	self isActive ifTrue: [link linkSet llsc activateAnotherLink: link].
	self deactivateLink.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> emergency [
	"LLSC -> LSAC"
	self isInactive
		ifTrue: [^self markEmergency].
	self isActivatingAndRestoring
		ifTrue: [
			self markEmergency.
			^self mtpLevel3Boundary emergency].
	self isActive
		ifTrue: [^self markEmergency].
	
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> emergencyCeases [
	"LLSC -> LSAC"
	self isInactive
		ifTrue: [^self cancelEmergency].
		
	self isActivatingAndRestoring
		ifTrue: [
			self cancelEmergency.
			^link mtpLevel3Boundary emergencyCeases].
		
	self isActive 
		ifTrue: [^self cancelEmergency].
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> flushBuffers [
	"TLAC -> LSAC"
	self isActive ifFalse: [^self].

	link mtpLevel3Boundary flushBuffers.
]

{ #category : #creation }
MTP3SignallingLinkActivityControl >> initialize [
	super initialize.
	self setState: self class stateInactive.
	firstFailure := false.
	activiationRestorationUnsuccessful := true.
	emergency := false.
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> isActivatingAndRestoring [
	^state = self class stateActivatingAndRestoring
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> isActivationRestorationUnsuccessful [
	^activiationRestorationUnsuccessful
]

{ #category : #states }
MTP3SignallingLinkActivityControl >> isActive [
	^state = self class stateActive
]

{ #category : #states }
MTP3SignallingLinkActivityControl >> isInactive [
	^state = self class stateInactive
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> linkInService [
	self isActivatingAndRestoring ifFalse: [ ^self].

	link sltc start
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> markActivation [
	self flag: #todo.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> outOfService [
	"L2 -> L3"
	self isActivatingAndRestoring ifTrue: [^self outOfServiceForActivationAndRestoration].
	self isActive ifTrue: [^self outOfServiceForActive].

]

{ #category : #support }
MTP3SignallingLinkActivityControl >> outOfServiceForActivationAndRestoration [
	"L2 -> L3"
	self isActivationRestorationUnsuccessful ifFalse: [^self].

	firstFailure
		ifTrue: [link lsta terminalAvailable: link. firstFailure := false]
		ifFalse: [firstFailure := true].
	self isActivation
		ifTrue: [
			self cancelActivation.
			link lsla restartActivation]
		ifFalse: [
			link lslr restartRestoration]
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> outOfServiceForActive [
	"L2 -> L3"
	link tlac linkFailed.
	link linkSet llsc linkFailed: link.

	"Failed state.. only if.. retrieval cann not.. but... see sheet 7/10"

	link lslr startRestoration.
	self setState: self class stateActivatingAndRestoring
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> remoteProcessorOut [
	self notYetImplemented
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> remoteProcessorRecovered [
	"L2 -> LSAC or L2 -> L3"
	self notYetImplemented
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> restartEnds [
	"LLSC -> LSAC"
	self isActivatingAndRestoring ifFalse: [^self].

	link tlac linkFailed.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> restorationUnsuccessful [
	"LSLR -> LSAC"
	self activationUnsuccesful
]

{ #category : #states }
MTP3SignallingLinkActivityControl >> setState: newState [
	state := newState
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> sltFailed [
	"SLTC -> LSAC"
	"This is not specified for the active link.. but go through the same code"
	self deactivateLink
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> sltSuccessfull [
	"The signalling link test has been successfull"
	self isActivatingAndRestoring ifFalse: [^self].

	link tlac signallingLinkInService.
	link linkSet llsc linkActive: self.
	self cancelFirstFailure.
	self cancelActivationRestorationUnsuccessful.
	self setState: self class stateActive.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> startSignallingLink [
	"LSLA -> LSAC or LSLR -> LSAC"

	self startT17.
	self setState: self class stateWait.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> stopL2 [
	"TCOC -> LSAC"
	self flag: #todo. "ChangeOver is not implemented"
]

{ #category : #support }
MTP3SignallingLinkActivityControl >> stopLink [
	"I implement Sheet 5 of 10 of signalling link activity control"
	link mtpLevel3Boundary stop.
	link lsld deactivateLink.
	link lsla deactivateLink.
	"This is not in the diagrams. It might not be right."
	link sltc stop.
	link linkSet llsc linkInactive: link.
	
	activiationRestorationUnsuccessful
		ifTrue: [activiationRestorationUnsuccessful := false]
		ifFalse: [link linkSet llsc activateAnotherLink: link].

	self setState: self class stateInactive.
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivityControl >> t17Expired [
	"Timer Expiration"
	emergency
		ifTrue: [link mtpLevel3Boundary emergency].
	link mtpLevel3Boundary start.
	self setState: self class stateActivatingAndRestoring.
]

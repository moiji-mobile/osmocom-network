Class {
	#name : #MTP3SignallingLinkSetControl,
	#superclass : #MTP3LinksetHandlingBase,
	#instVars : [
		'state'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #states }
MTP3SignallingLinkSetControl class >> stateActive [
	^#Active
]

{ #category : #states }
MTP3SignallingLinkSetControl class >> stateInactive [
	^#Inactive
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> activateAnotherLink: aLink [
	"LSAC -> LLSC"
	self isActive ifFalse: [^self].

	self flag: #todo.
	(self activationOfALink: aLink)
		ifTrue: [self selectLinkAndActivate]
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> activateLinkSet [
	"MGMT -> LLSC"
	self isInactive ifFalse: [^self].

	self selectAndActivateLinks.
]

{ #category : #support }
MTP3SignallingLinkSetControl >> anyLinkActive [
	linkSet links do: [:link |
		link lsac isActive ifTrue: [^true] ].
	^false
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> deactivateLinkset [
	"MGMT -> LLSC"
	self isActive ifFalse: [^self].
	
	linkSet links do: [:each |
		each lsac deactivateLink].

	state := self class stateInactive.
]

{ #category : #support }
MTP3SignallingLinkSetControl >> deactivationOfALink: aLink [
	"Is current number of active links greater than specified number?"
	self flag: #todo. "We have no concept of how many active links"
	^false
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> emergency [
	"TSRC -> LSAC"
	self isActive ifFalse: [^self].

	linkSet links do: [:each |
		each lsac emergency]
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> emergencyCeases [
	"TSRC -> LLSC"
	self isActive ifFalse: [^self].

	linkSet links do: [:each |
		each emergencyCeases]
]

{ #category : #creation }
MTP3SignallingLinkSetControl >> initialize [
	super initialize.
	state := self class stateInactive
]

{ #category : #support }
MTP3SignallingLinkSetControl >> isActive [
	^state = self class stateActive
]

{ #category : #support }
MTP3SignallingLinkSetControl >> isInactive [
	^state = self class stateInactive
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> linkActive: aLink [
	self isActive ifFalse: [^self].

	(self deactivationOfALink: aLink)
		ifTrue: [aLink lsac deactivateLink].
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> linkFailed: aLink [
	"LSAC -> LLSC"
	self isActive ifFalse: [^self].

	"As long as not everything failed... keep going"
	self anyLinkActive
		ifFalse: [self selectAndActivateLinks].
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> linkInactive: aLink [
	self isActive ifFalse: [^self].
	self flag: #todo."Nothing? Update SLC/SLS map?"
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> restartBegins [
	"TPRC->LLSC"
	self selectAndActivateLinks.
]

{ #category : #'Q.704' }
MTP3SignallingLinkSetControl >> restartEnds: aLink [
	"TPRC->LLSC"
	self isActive ifFalse: [^self].

	aLink lsac restartEnds.
]

{ #category : #support }
MTP3SignallingLinkSetControl >> selectAndActivateLinks [
	| links |
	"This is for (1), (4) and part of the other two functions"

	links := self selectLinksToActivate.
	links do: [:each |
		each lsac activateLink.
	].

	state := self class stateActive.
]

{ #category : #support }
MTP3SignallingLinkSetControl >> selectLinkAndActivate [
	| link |
	"This is for 'Select link to activate' and 'Activate link"
	self shouldBeImplemented.
	
	link lsac activateLink.
]

{ #category : #support }
MTP3SignallingLinkSetControl >> selectLinksToActivate [
	^linkSet allNonBlockedLinks.
]

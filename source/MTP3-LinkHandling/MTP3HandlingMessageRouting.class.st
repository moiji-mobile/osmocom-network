"
I am a Handling Message Routing (HMRT).

I am overkill too and belong to a linkset. I can be found in Q.704 of the specification.
"
Class {
	#name : #MTP3HandlingMessageRouting,
	#superclass : #MTP3HandlingBase,
	#instVars : [
		'adjacentSpRestarts',
		'spRestart'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> adjacentSPRestart [
	"Sent from TSRC"
	"TODO: this is only for the Idle state"
	adjacentSpRestarts := true.
]

{ #category : #support }
MTP3HandlingMessageRouting >> cancelMarks [
	self notImplemented
]

{ #category : #support }
MTP3HandlingMessageRouting >> congestionControl: aMsg [
	| link |
	"This is (5) of the machine. Specs says 'TSEC' but that does not exist"
	(self isDestinationCongested: aMsg label dpc)
		ifTrue: [mtp3Service destinationCongested: aMsg label dpc].

	link := self selectLinkFor: aMsg.
	self sendMessage: aMsg on: link.
	
]

{ #category : #support }
MTP3HandlingMessageRouting >> discardMessage: aMsg [
	mtp3Service discardMessage: aMsg
]

{ #category : #support }
MTP3HandlingMessageRouting >> dpcSpRestarts: aDpc [
	self flag: #todo. "We don't keep track of restarting SPs right now"
	^false
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> forcedUninhibit [
	^self notYetImplemented
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> handleTrafficManagement: aMsg link: aLink [
	| link |
	"This is (8) of the HMRT"
	(self managementInhibitsMessage: aMsg)
		ifTrue: [ ^ self inhibitedMessage: aMsg ].
	(mtp3Service dpcRoutable: aMsg)
		ifFalse: [ ^ self unroutableMessage: aMsg link: aLink ].
	aMsg isChangebackMessage
		ifFalse: [ ^ self sendOnAvailableLinkFor: aMsg ].
	aMsg isChangebackDeclarations
		ifFalse: [ ^ self sendOnAvailableLinkFor: aMsg ].
	link := self selectAlternativeOnSLCAndChangeback: aMsg.
	self sendMessage: aMsg on: link
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> inhibitedMessage: aMsg [
	"This is the right branch of (8)"
	self forcedUninhibit
		ifTrue:[^self sendToLinkCodedSLC: aMsg].

	aMsg isUnhibitOrUnhibitAck
		ifFalse: [^self sendOnAvailableLinkFor: aMsg].
	(mtp3Service dpcRoutable: aMsg label dpc)
		ifTrue: [^self sendOnAvailableLinkFor: aMsg].
	self sendToLinkCodedSLC: aMsg.
]

{ #category : #creation }
MTP3HandlingMessageRouting >> initialize [
	super initialize.
	adjacentSpRestarts := false.
	spRestart := false.
]

{ #category : #support }
MTP3HandlingMessageRouting >> internalRouteMessage: aMsg link: aLink [
	"This is for (11) and Message for routing that do the same thing"

	(mtp3Service dpcRoutable: aMsg)
		ifFalse: [ ^ self unroutableMessage: aMsg link: aLink ].
	(self dpcSpRestarts: aMsg label dpc)
		ifTrue: [ ^ self discardMessage: aMsg ].
	self congestionControl: aMsg
]

{ #category : #support }
MTP3HandlingMessageRouting >> isDestinationCongested: aMsg [
	self flag: #todo. "We don't do congestion control"
	^false
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> managementInhibitsMessage: aMsg [
	self notYetImplemented
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> restartBegins [
	"Sent from TPRC"
	"TODO this is only for the idle state"
	spRestart := true.
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> restartEnds [
	"Sent from the TPRC. It will always go to the idle state"
	self cancelMarks.
	spRestart := false.
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> routeMessage: aMsg link: aLink [
	"Message from HMDC or transferRequest: with nul as link"

	"Sheet 4/5"

	spRestart
		ifTrue: [ ^ self discardMessage: aMsg ].
	(mtp3Service dpcRoutable: aMsg)
		ifFalse: [ ^ self unroutableMessage: aMsg link: aLink ].
	(self dpcSpRestarts: aMsg label dpc)
		ifTrue: [ ^ self discardMessage: aMsg ].
	self congestionControl: aMsg
]

{ #category : #support }
MTP3HandlingMessageRouting >> routeMessageDuringRestart: aMsg [
	"This is for (11)"
	
	"This is different to the normal routeMessage"
	(mtp3Service dpcRoutable: aMsg)
		ifFalse: [^self discardMessage: aMsg].

	self congestionControl: aMsg
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> selectAlternativeOnSLCAndChangeback: aMsg [
	self notYetImplemented
]

{ #category : #support }
MTP3HandlingMessageRouting >> selectAvailableLinkFor: aMsg [
	"Select linkset/link based on destination as of sheet 2 of five"
	self notImplemented.
]

{ #category : #support }
MTP3HandlingMessageRouting >> selectDirectLinkAndSend: aMsg [
	| link |
 	"Select a link in the direct linkset to DPC"
	self notYetImplemented.
	self sendMessage: aMsg on: link.
]

{ #category : #support }
MTP3HandlingMessageRouting >> selectLinkBasedOnSLSFor: aMsg [
	^self notYetImplemented
]

{ #category : #support }
MTP3HandlingMessageRouting >> selectLinkFor: aMsg [
	| linkSet |
	"Select linkset/link based on destination"
	self flag: #todo. "Pick the first routable/active linkset and a link based on SLS"
	linkSet := (mtp3Service linkSets select:
					[:each | 
						(each dpc = aMsg label dpc) and: [each llsc isActive]]) first.
	^linkSet allNonBlockedLinks first
]

{ #category : #support }
MTP3HandlingMessageRouting >> sendMessage: aMsg on: aLink [
	"This is (3) and (6) on the graph"
	mtp3Service hmcg sendMessage: aMsg toMessage on: aLink.

]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> sendOnAvailableLinkFor: aMsg [
	| link |
	link := self selectAvailableLinkFor: aMsg.
	self sendMessage: aMsg on: link.
]

{ #category : #'support-8' }
MTP3HandlingMessageRouting >> sendToLinkCodedSLC: aMsg link: aLink [
	self sendMessage: aMsg on: aLink.
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> signallingLinkTestControl: aMsg link: aLink [
	"Sent from the SLTC"
	self sendToLinkCodedSLC: aMsg link: aLink
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> signallingManagementMessage: aMsg link: aLink [
	| link |
	"Sent from the SLM"
	"This is for:
	- signalling data link connection order
	- connection successful
	- connection not successful
	- Connection not possible
"
	"Sheet 4/5"
	spRestart
		ifTrue: [ ^ self discardMessage: aMsg ].
	(mtp3Service dpcSpRestarts: aMsg label dpc)
		ifTrue: [ ^ self discardMessage: aMsg ].
	(mtp3Service dpcRoutable: aMsg label dpc)
		ifFalse: [ ^ self unroutableMessage: aMsg link: aLink ].
	link := self selectAvailableLinkFor: aMsg.
	self sendMessage: aMsg on: link
]

{ #category : #'support-9' }
MTP3HandlingMessageRouting >> signallingRouteManagementDuringRestart: aMsg [
	aMsg dispatchForSignallingRouteManagementDuringRestart: self.
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> signallingRouteManagementMessage: aMsg link: aLink [
	"Sent from the SRM"

	spRestart
		ifTrue: [ ^ self signallingRouteManagementDuringRestart: aMsg ].
	(mtp3Service dpcSpRestarts: aMsg label dpc)
		ifFalse: [ ^ self congestionControl: aMsg ].
	(mtp3Service dpcRoutable: aMsg label dpc)
		ifFalse: [ ^ self unroutableMessage: aMsg link: aLink ].
	aMsg dispatchForSignallingRouteManagement: self
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> signallingTrafficManagement: aMsg [
	"From STM to us"
	spRestart ifTrue: [^self signallingTrafficManagementDuringRestart: aMsg].

	(mtp3Service dpcSpRestarts: aMsg label dpc)
		ifFalse: [^self handleTrafficManagement: aMsg].
	aMsg dispatchForSignallingTrafficManagement: aMsg.
]

{ #category : #'support-9' }
MTP3HandlingMessageRouting >> signallingTrafficManagementDuringRestart: aMsg [
	aMsg dispatchForSignallingTrafficManagementDuringRestart: self.
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> transferRequest: aMsg [
	"Coming from Layer4 to us"
	"Sheet 4/5"
	spRestart ifTrue: [^self discardMessage].

	self routeMessage: aMsg link: nil.
]

{ #category : #support }
MTP3HandlingMessageRouting >> unroutableMessage: aMsg link: aLink [
	"This is the (1) from the machine"
	(mtp3Service originatesFromSP: aMsg link: aLink)
		ifTrue: [^self discardMessage: aMsg].
	mtp3Service mgmt receivedForUnknownSP: aMsg.
	mtp3Service rtpc receivedForInaccessibleSP: aMsg.
	
	self discardMessage: aMsg
]

{ #category : #'Q.704' }
MTP3HandlingMessageRouting >> updateRoutingTables [
	"Sent from the STM."
	self notImplemented
]

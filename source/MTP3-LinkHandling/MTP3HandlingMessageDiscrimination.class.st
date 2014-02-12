"
I am a Signalling Message Handling Discriminator (HMDC)

To be honest this specification is such an overkill.
"
Class {
	#name : #MTP3HandlingMessageDiscrimination,
	#superclass : #MTP3HandlingBase,
	#instVars : [
		'spRestarting'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #support }
MTP3HandlingMessageDiscrimination >> discardMessage: aMsg [
	mtp3Service discardMessage: aMsg
]

{ #category : #support }
MTP3HandlingMessageDiscrimination >> distributeMessage: aMsg link: aLink [
	mtp3Service hmdt messageForDistribution: aMsg link: aLink
]

{ #category : #creation }
MTP3HandlingMessageDiscrimination >> initialize [
	super initialize.
	spRestarting := false.
]

{ #category : #support }
MTP3HandlingMessageDiscrimination >> isMessageForUs: aMsg link: aLink [
	"Is our OPC the Destination?"
	^aLink linkSet opc = aMsg label dpc
]

{ #category : #support }
MTP3HandlingMessageDiscrimination >> isSPRestarting [
	^spRestarting
]

{ #category : #'Q.704' }
MTP3HandlingMessageDiscrimination >> receivedMessage: aMsg [
	(self isMessageForUs: aMsg)
		ifTrue: [self distributeMessage: aMsg]
		ifFalse: [self routeMessage: aMsg].
]

{ #category : #'Q.704' }
MTP3HandlingMessageDiscrimination >> receivedMessage: aMsg link: aLink [
	(self isMessageForUs: aMsg link: aLink)
		ifTrue: [self distributeMessage: aMsg link: aLink]
		ifFalse: [self routeMessage: aMsg link: aLink].
]

{ #category : #'Q.704' }
MTP3HandlingMessageDiscrimination >> restartBegins [
	spRestarting := true.
]

{ #category : #'Q.704' }
MTP3HandlingMessageDiscrimination >> restartEnds [
	spRestarting := false
]

{ #category : #support }
MTP3HandlingMessageDiscrimination >> routeMessage: aMsg [
	self isSPRestarting
		ifTrue: [self discardMessage: aMsg]
		ifFalse: [mtp3Service hmrt routeMessage: aMsg]
]

{ #category : #support }
MTP3HandlingMessageDiscrimination >> routeMessage: aMsg link: aLink [
	self isSPRestarting
		ifTrue: [self discardMessage: aMsg]
		ifFalse: [mtp3Service hmrt routeMessage: aMsg link: aLink]
]

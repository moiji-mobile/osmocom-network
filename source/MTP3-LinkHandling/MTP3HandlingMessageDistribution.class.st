"
I am a Message Distributor (HMDT) from Q.704

This class has two states Idle/Restart that is handled with an if inside the messageForDistribution.
"
Class {
	#name : #MTP3HandlingMessageDistribution,
	#superclass : #MTP3HandlingBase,
	#instVars : [
		'spRestarts'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #creation }
MTP3HandlingMessageDistribution >> initialize [
	super initialize.
	spRestarts := false
]

{ #category : #'Q.704' }
MTP3HandlingMessageDistribution >> messageForDistribution: aMsg link: aLink [
	"This is from Page 91 to 93 of Q.704"
	"Double dispatch on the MTP3BaseMSG as of the picture on the link as SLTM/SLTA
	  is based on the link and not subject to load sharing"
	spRestarts
		ifTrue: [aMsg dispatchForMessageDistributionOnRestart: aLink]
		ifFalse: [aMsg dispatchForMessageDistributionOn: aLink].
	
	
]

{ #category : #'Q.704' }
MTP3HandlingMessageDistribution >> restartBegins [
	spRestarts := true.
]

{ #category : #'Q.704' }
MTP3HandlingMessageDistribution >> restartEnds [
	"Check that we are in the right state"
	spRestarts := false.
]

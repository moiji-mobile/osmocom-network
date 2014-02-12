"
I represent a Signalling Link Deactivation (LSLD)
"
Class {
	#name : #MTP3SignallingLinkDeactivation,
	#superclass : #MTP3LinkHandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3SignallingLinkDeactivation >> deactivateLink [
	"LSAC -> LSLD"
	link mtpLevel3Boundary disconnect.
]

"
I am a Signalling Link Activation (LSLA)
"
Class {
	#name : #MTP3SignallingLinkActivation,
	#superclass : #MTP3LinkHandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3SignallingLinkActivation >> deactivateLink [
	"LSAC -> LSLA but that doesn't make any sense"
]

{ #category : #'Q.704' }
MTP3SignallingLinkActivation >> startActivation [
	"LSAC -> LSLA"
	"I am a very simplified machine. I will ask the MTP3 Boundary to connect.."
	link mtpLevel3Boundary connect.
]

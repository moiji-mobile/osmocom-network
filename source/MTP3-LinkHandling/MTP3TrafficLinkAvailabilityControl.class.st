"
I represent a link availability control (TLAC).. but I am a stub right now
"
Class {
	#name : #MTP3TrafficLinkAvailabilityControl,
	#superclass : #MTP3LinkHandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3TrafficLinkAvailabilityControl >> signallingLinkFailed [
	"LSAC -> TLAC"
	self flag: #todo.

	"Say we are ready"
	link lsac STMReady.
]

{ #category : #'Q.704' }
MTP3TrafficLinkAvailabilityControl >> signallingLinkInService [
	"LSAC->TLAC"
	self flag: #todo.
]

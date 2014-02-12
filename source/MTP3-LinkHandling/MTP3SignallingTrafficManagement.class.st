Class {
	#name : #MTP3SignallingTrafficManagement,
	#superclass : #MTP3HandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3SignallingTrafficManagement >> signallingTrafficManagement: aMsg link: aLink [ 
	mtp3Service discardMessage: aMsg
]

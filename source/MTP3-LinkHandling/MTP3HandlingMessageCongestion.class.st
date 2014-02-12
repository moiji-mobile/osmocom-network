Class {
	#name : #MTP3HandlingMessageCongestion,
	#superclass : #MTP3HandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3HandlingMessageCongestion >> sendMessage: aMsg on: aLink [
	"Message from the HMRT"
	self flag: #todo. "No congestion control yet"
	aLink send: aMsg.
]

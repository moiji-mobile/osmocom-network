"
I am the debug area for MTP Layer3
"
Class {
	#name : #LogAreaMTP3,
	#superclass : #LogArea,
	#category : #'MTP3-LinkHandling'
}

{ #category : #accessing }
LogAreaMTP3 class >> areaDescription [
	^'MTP Level 3'
]

{ #category : #accessing }
LogAreaMTP3 class >> areaName [
	^#mtp3
]

{ #category : #default }
LogAreaMTP3 class >> default [
	^(self new)
		enabled: true;
		minLevel: LogLevel notice;
		yourself
]

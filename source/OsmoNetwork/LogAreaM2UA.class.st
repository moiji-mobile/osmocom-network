"
I am the debug area for M2UA messages
"
Class {
	#name : #LogAreaM2UA,
	#superclass : #LogArea,
	#category : #M2UA
}

{ #category : #accessing }
LogAreaM2UA class >> areaDescription [
	^'MTP2 User Adaption'

]

{ #category : #accessing }
LogAreaM2UA class >> areaName [
	^#m2ua

]

{ #category : #creation }
LogAreaM2UA class >> default [
	^(self new)
	    enabled: true;
	    minLevel: LogLevel debug;
	    yourself

]

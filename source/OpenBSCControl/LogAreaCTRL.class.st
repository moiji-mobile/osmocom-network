"
I am the debug area for the Osmocom Control (CTRL) Protocol
"
Class {
	#name : #LogAreaCTRL,
	#superclass : #LogArea,
	#category : #OpenBSCControl
}

{ #category : #'as yet unclassified' }
LogAreaCTRL class >> areaDescription [
	^'Osmo CTRL handling'

]

{ #category : #'as yet unclassified' }
LogAreaCTRL class >> areaName [
	^#ctrl

]

{ #category : #'as yet unclassified' }
LogAreaCTRL class >> default [
	^(self new)
	    enabled: true;
	    minLevel: LogLevel debug;
	    yourself

]

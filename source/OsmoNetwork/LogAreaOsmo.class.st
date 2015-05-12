"
I am the debug area for Osmo networking
"
Class {
	#name : #LogAreaOsmo,
	#superclass : #LogArea,
	#category : #'OsmoNetwork-Socket'
}

{ #category : #'as yet unclassified' }
LogAreaOsmo class >> areaDescription [
	^'Osmo socket/connection releated code'

]

{ #category : #'as yet unclassified' }
LogAreaOsmo class >> areaName [
	^#osmo

]

{ #category : #'as yet unclassified' }
LogAreaOsmo class >> default [
	^(self new)
	    enabled: true;
	    minLevel: LogLevel debug;
	    yourself

]

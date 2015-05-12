"
I am the debug area for SCCP.
"
Class {
	#name : #LogAreaSCCP,
	#superclass : #LogArea,
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #accessing }
LogAreaSCCP class >> areaDescription [
	^'SCCP related'

]

{ #category : #accessing }
LogAreaSCCP class >> areaName [
	^#sccp

]

{ #category : #creation }
LogAreaSCCP class >> default [
	^(self new)
	    enabled: true;
	    minLevel: LogLevel debug;
	    yourself

]

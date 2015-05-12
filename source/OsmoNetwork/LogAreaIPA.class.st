"
I am the debug area for IPA messages.
"
Class {
	#name : #LogAreaIPA,
	#superclass : #LogArea,
	#category : #'OsmoNetwork-IPA'
}

{ #category : #accessing }
LogAreaIPA class >> areaDescription [
	^'IPA related'

]

{ #category : #accessing }
LogAreaIPA class >> areaName [
	^#ipa

]

{ #category : #creation }
LogAreaIPA class >> default [
	^(self new)
	    enabled: true;
	    minLevel: LogLevel debug;
	    yourself

]

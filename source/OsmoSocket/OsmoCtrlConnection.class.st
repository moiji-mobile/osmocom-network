Class {
	#name : #OsmoCtrlConnection,
	#superclass : #OsmoAppConnection,
	#instVars : [
		'ctrlBlock'
	],
	#category : #'OsmoSocket-Legacy'
}

{ #category : #'ctrl-dispatch' }
OsmoCtrlConnection >> handleCTRL: aCtrl [
	ctrlBlock value: aCtrl

]

{ #category : #'as yet unclassified' }
OsmoCtrlConnection >> initializeDispatcher [
	super initializeDispatcher.
	dispatcher 
	    addHandler: IPAConstants protocolOsmoCTRL
	    on: self
	    with: #handleCTRL:

]

{ #category : #'ctrl-dispatch' }
OsmoCtrlConnection >> onCtrlData: aBlock [
	ctrlBlock := aBlock

]

{ #category : #'as yet unclassified' }
OsmoCtrlConnection >> sendCtrlData: aData [
	self nextPut: aData with: IPAConstants protocolOsmoCTRL

]

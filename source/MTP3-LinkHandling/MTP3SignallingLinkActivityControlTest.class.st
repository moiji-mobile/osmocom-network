"
A MTP3SignallingLinkActivityControlTest is a test class for testing the behavior of MTP3SignallingLinkActivityControl
"
Class {
	#name : #MTP3SignallingLinkActivityControlTest,
	#superclass : #TestCase,
	#instVars : [
		'discarded',
		'boundary',
		'link',
		'linkSet'
	],
	#category : #'MTP3-LinkHandling-Tests'
}

{ #category : #'as yet unclassified' }
MTP3SignallingLinkActivityControlTest >> setUp [
	discarded := OrderedCollection new.
	boundary := MTPL3MockLayer3Boundary new.
	link := MTPLevel3Link new
			mtpLevel3Boundary: boundary;
			yourself.
	linkSet := MTPLevel3Linkset new
			opc: 2000;
			dpc: 11;
			yourself.
	linkSet addLink: link.
	linkSet mtp3Service
		onMessageDiscarded: [ :msg | discarded add: msg ] 
]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkActivityControlTest >> tearDown [
	link sltc stop.
]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkActivityControlTest >> testDeactivateLink [
	self assert: link lsac isInactive.
	
	link lsac activateLink.	
	self assert: link lsac isActivatingAndRestoring.
	
	link lsac linkInService.
	self assert: link lsac isActivatingAndRestoring.
	self assert: link sltc isT1Running.

	"Stop but fake a sltSuccess"
	link sltc stop.
	link lsac sltSuccessfull.
	self assert: link lsac isActive.

	"Now really deactivate it"
	link lsac deactivateLink.
]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkActivityControlTest >> testLinkInService [
	self assert: link lsac isInactive.
	
	link lsac activateLink.	
	self assert: link lsac isActivatingAndRestoring.
	
	link lsac linkInService.
	self assert: link lsac isActivatingAndRestoring.
	self assert: link sltc isT1Running.

	link sltc stop.

]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkActivityControlTest >> testSltSuccessful [
	self assert: link lsac isInactive.
	
	link lsac activateLink.	
	self assert: link lsac isActivatingAndRestoring.
	
	link lsac sltSuccessfull.
	self assert: link lsac isActive.

]

Class {
	#name : #MTP3SignallingLinkSetControlTest,
	#superclass : #TestCase,
	#instVars : [
		'linkSet',
		'link',
		'discarded',
		'boundary'
	],
	#category : #'MTP3-LinkHandling-Tests'
}

{ #category : #'as yet unclassified' }
MTP3SignallingLinkSetControlTest >> setUp [
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
MTP3SignallingLinkSetControlTest >> tearDown [
	linkSet stop.
	link sltc stop.
]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkSetControlTest >> testCreation [
	"Just... to check if nothing "
	linkSet start.
	linkSet stop.
]

{ #category : #'as yet unclassified' }
MTP3SignallingLinkSetControlTest >> testLinkActive [
	linkSet start.
	linkSet llsc linkActive: link.
	linkSet stop.
]

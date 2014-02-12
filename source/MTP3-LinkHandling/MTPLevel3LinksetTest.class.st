"
A MTPLevel3LinksetTest is a test class for testing the behavior of MTPLevel3Linkset
"
Class {
	#name : #MTPLevel3LinksetTest,
	#superclass : #TestCase,
	#instVars : [
		'link',
		'linkSet',
		'boundary',
		'discarded'
	],
	#category : #'MTP3-LinkHandling-Tests'
}

{ #category : #support }
MTPLevel3LinksetTest >> createLabel [
	^MTP3Label new
		opc: 11;
		dpc: 2000;
		slc: 0;
		yourself
]

{ #category : #support }
MTPLevel3LinksetTest >> routeSltaExample [
	| msg |
	msg := MTP3SLTAMSG new
				label: (self createLabel dpc: 4000; yourself);
				testPattern: 'HiSmalltalk' asByteArray;
				yourself.
	^msg
	
]

{ #category : #'as yet unclassified' }
MTPLevel3LinksetTest >> setUp [
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

{ #category : #support }
MTPLevel3LinksetTest >> sltaExample [
	| msg |
	msg := MTP3SLTAMSG new
				label: self createLabel;
				testPattern: 'HiSmalltalk' asByteArray;
				yourself.
	^msg
	
]

{ #category : #support }
MTPLevel3LinksetTest >> sltmExample [
	| msg |
	msg := MTP3SLTMMSG new
				label: self createLabel;
				testPattern: 'fooo' asByteArray;
				yourself.
	^msg
	
]

{ #category : #'as yet unclassified' }
MTPLevel3LinksetTest >> tearDown [
	linkSet stop
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForSLTA [
	linkSet mtp3Service hmdc receivedMessage: self sltaExample link: link.
	self assert: boundary sentData size = 0.
	
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForSLTARoute [
	"Test that this goes to the HDRT for routing....and is discarded"
	linkSet mtp3Service hmdc receivedMessage: self routeSltaExample link: link.
	self assert: boundary sentData size = 0.

	self assert: discarded size = 1.
	self assert: discarded first class = MTP3SLTAMSG.
	
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForSLTM [
	| msg |
	linkSet mtp3Service hmdc receivedMessage: self sltmExample link: link.

	self assert: boundary sentData size = 1.	
	msg := MTP3MSG parseFrom: boundary sentData first key readStream.
	self assert: msg class = MTP3SLTAMSG.
	self assert: discarded isEmpty.
	
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForTFA [
	"Ignoring most of it..."
	linkSet mtp3Service hmdc receivedMessage: self tfaExample link: link.
	self assert: boundary sentData size = 0.
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForTFP [
	"Ignoring most of it..."
	linkSet mtp3Service hmdc receivedMessage: self tfpExample link: link.
	self assert: boundary sentData size = 0.
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForTFR [
	"Ignoring most of it..."
	linkSet mtp3Service hmdc receivedMessage: self tfrExample link: link.
	self assert: boundary sentData size = 0.
]

{ #category : #HMDC }
MTPLevel3LinksetTest >> testMessageDiscriminationForTRA [
	"Ignoring most of it..."
	linkSet mtp3Service hmdc receivedMessage: self traExample link: link.
	self assert: boundary sentData size = 0.
]

{ #category : #support }
MTPLevel3LinksetTest >> tfaExample [
	| msg |
	msg := MTP3TFAMSG new
				label: self createLabel;
				yourself.
	^msg
]

{ #category : #support }
MTPLevel3LinksetTest >> tfpExample [
	| msg |
	msg := MTP3TFPMSG new
				label: self createLabel;
				yourself.
	^msg
	
]

{ #category : #support }
MTPLevel3LinksetTest >> tfrExample [
	| msg |
	msg := MTP3TFRMSG new
				label: self createLabel;
				yourself.
	^msg
	
]

{ #category : #support }
MTPLevel3LinksetTest >> traExample [
	| msg |
	msg := MTP3TRAMSG new
				label: self createLabel;
				yourself.
	^msg
	
]

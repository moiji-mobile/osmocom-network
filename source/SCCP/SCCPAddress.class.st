"
I represent the SCCP Address including the
    SSN, GTI if present.
"
Class {
	#name : #SCCPAddress,
	#superclass : #Object,
	#instVars : [
		'subSystemNumber',
		'globalTitle',
		'routedOnSsn',
		'pointCode',
		'gti_ind'
	],
	#category : #SCCP
}

{ #category : #creation }
SCCPAddress class >> createForSSN: aSymbol [
	^self createWith: (self perform: ('ssn' , aSymbol asUppercase) asSymbol)

]

{ #category : #creation }
SCCPAddress class >> createWith: ssn [
	^self createWith: ssn pointCode: nil

]

{ #category : #creation }
SCCPAddress class >> createWith: ssn poi: aPointCode [
	self deprecated: 'Use >>#createWith:pointCode: instead'.
	^self createWith: ssn pointCode: aPointCode

]

{ #category : #creation }
SCCPAddress class >> createWith: ssn pointCode: aPointCode [
	^(self new)
	    ssn: ssn;
	    routedOnSSN: true;
	    pointCode: aPointCode;
	    yourself

]

{ #category : #parsing }
SCCPAddress class >> parseFrom: aByteArray [
	| routed_ssn gti_ind gti len ai ssn pointCode dat |
	pointCode := nil.
	len := aByteArray at: 1.
	ai := aByteArray at: 2.

	"Copy the address"
	dat := aByteArray copyFrom: 3 to: len + 1.

	"Point Code"
	(ai bitAnd: 1) = 1 
	    ifTrue: 
		[pointCode := dat ushortAt: 1.
		dat := dat copyFrom: 3 to: dat size].

	"SSN"
	routed_ssn := (ai bitAnd: 16r40) = 16r40.
	ssn := dat at: 1.
	dat := dat copyFrom: 2 to: dat size.

	"GTI"
	gti_ind := (ai bitAnd: 16r3C) bitShift: -2.
	gti := dat copyFrom: 1 to: dat size.
	^(self new)
	    ssn: ssn;
	    pointCode: pointCode;
	    routedOnSSN: routed_ssn;
	    gti: gti indicator: gti_ind;
	    yourself

]

{ #category : #constants }
SCCPAddress class >> ssnAUC [
	^10

]

{ #category : #constants }
SCCPAddress class >> ssnBroadISDN [
	^13

]

{ #category : #constants }
SCCPAddress class >> ssnCAP [
	^146

]

{ #category : #constants }
SCCPAddress class >> ssnEIC [
	^9

]

{ #category : #constants }
SCCPAddress class >> ssnGSMSCF [
	^147

]

{ #category : #constants }
SCCPAddress class >> ssnGsmSCF [
	^147

]

{ #category : #constants }
SCCPAddress class >> ssnHLR [
	^6

]

{ #category : #constants }
SCCPAddress class >> ssnISUP [
	^3

]

{ #category : #constants }
SCCPAddress class >> ssnISUPSRV [
	^11

]

{ #category : #constants }
SCCPAddress class >> ssnITURsrvd [
	^2

]

{ #category : #constants }
SCCPAddress class >> ssnMAP [
	^5

]

{ #category : #constants }
SCCPAddress class >> ssnMSC [
	^8

]

{ #category : #constants }
SCCPAddress class >> ssnNotKnown [
	^0

]

{ #category : #constants }
SCCPAddress class >> ssnOMA [
	^4

]

{ #category : #constants }
SCCPAddress class >> ssnReserved [
	^12

]

{ #category : #constants }
SCCPAddress class >> ssnSCCPMgnt [
	^1

]

{ #category : #constants }
SCCPAddress class >> ssnSGSN [
	^149

]

{ #category : #constants }
SCCPAddress class >> ssnTCTest [
	^14

]

{ #category : #constants }
SCCPAddress class >> ssnVLR [
	^7

]

{ #category : #encoding }
SCCPAddress >> asByteArray [
	"Most simple address storing routine"

	| ai data |
	data := OrderedCollection new.

	"Create the Address Information"
	ai := 0.

	"SSN indicator"
	ai := ai bitOr: 2.
	self routedOnSSN ifTrue: [ai := ai bitOr: 64].

	"Point Code"
	pointCode ifNotNil: [ai := ai bitOr: 1].

	"GTI Indicator"
	gti_ind ifNotNil: [ai := ai bitOr: (gti_ind bitShift: 2)].
	data add: ai.

	"POC"
	pointCode ifNotNil: 
		[data add: ((pointCode bitAnd: 16r00FF) bitShift: 0).
		data add: ((pointCode bitAnd: 16rFF00) bitShift: -8)].

	"SSN"
	data add: subSystemNumber.

	"GTI"
	gti_ind ifNotNil: [globalTitle do: [:each | data add: each]].
	data addFirst: data size.
	^data asByteArray

]

{ #category : #gti }
SCCPAddress >> globalTitle [
	^globalTitle

]

{ #category : #gti }
SCCPAddress >> globalTitle: aGlobalTitle indicator: aGtiInd [
	globalTitle := aGlobalTitle.
	gti_ind := aGtiInd bitAnd: 16rF

]

{ #category : #deprecated }
SCCPAddress >> gti [
	^self globalTitle

]

{ #category : #gti }
SCCPAddress >> gti: aGlobalTitle indicator: aGtiInd [
	self globalTitle: aGlobalTitle indicator: aGtiInd

]

{ #category : #gti }
SCCPAddress >> gtiAsParsed [
	^self parseGlobalTitle

]

{ #category : #gti }
SCCPAddress >> gtiFromAddr: aGlobalTitle [
	gti_ind := aGlobalTitle class subType.
	globalTitle := aGlobalTitle asByteArray

]

{ #category : #gti }
SCCPAddress >> gtiInd [
	^gti_ind

]

{ #category : #gti }
SCCPAddress >> parseGlobalTitle [
	^gti_ind = 0 
	    ifTrue: [nil]
	    ifFalse: [SCCPGlobalTitle initWith: gti_ind data: globalTitle]

]

{ #category : #deprecated }
SCCPAddress >> poi [
	self deprecated: 'Use >>#pointCode instead'.
	^self pointCode

]

{ #category : #deprecated }
SCCPAddress >> poi: aPointCode [
	self deprecated: 'Use >>#pointCode: instead'.
	self pointCode: aPointCode

]

{ #category : #'point-code-indicator' }
SCCPAddress >> pointCode [
	^pointCode

]

{ #category : #'point-code-indicator' }
SCCPAddress >> pointCode: aPointCode [
	"When a non-nil point code is set the pointcode indicator will be set in the
	 address information."
	pointCode := aPointCode

]

{ #category : #ssn }
SCCPAddress >> routedOnSSN [
	^routedOnSsn ifNil: [false]

]

{ #category : #deprecated }
SCCPAddress >> routedOnSSN: aFlag [
	self routedOnSubSystenNumber: aFlag

]

{ #category : #ssn }
SCCPAddress >> routedOnSubSystenNumber: aFlag [
	routedOnSsn := aFlag

]

{ #category : #deprecated }
SCCPAddress >> ssn [
	^self subSystemNumber

]

{ #category : #deprecated }
SCCPAddress >> ssn: aSubSystemNumber [
	"deprecated"
	self subSystemNumber: aSubSystemNumber

]

{ #category : #accessing }
SCCPAddress >> subSystemNumber [
	^subSystemNumber

]

{ #category : #ssn }
SCCPAddress >> subSystemNumber: aSubSystemNumber [
	subSystemNumber := aSubSystemNumber

]

{ #category : #'as yet unclassified' }
SCCPAddress >> updateGlobalTitle: aGT [ 
	globalTitle := aGT
]

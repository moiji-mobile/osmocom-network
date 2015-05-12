"
I represent the Global Title of Q.713.
"
Class {
	#name : #SCCPGlobalTitle,
	#superclass : #Object,
	#instVars : [
		'indicator',
		'nai',
		'data'
	],
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #'encoding-scheme' }
SCCPGlobalTitle class >> esBCDEven [
	^2

]

{ #category : #'encoding-scheme' }
SCCPGlobalTitle class >> esBCDOdd [
	^1

]

{ #category : #'encoding-scheme' }
SCCPGlobalTitle class >> esNational [
	^3

]

{ #category : #'encoding-scheme' }
SCCPGlobalTitle class >> esUnknown [
	^0

]

{ #category : #creation }
SCCPGlobalTitle class >> formatAddr: aNumber on: data [
	| nr odd |
	nr := OrderedCollection new.
	odd := aNumber size odd.
	aNumber do: [:each | nr add: (self unmap: each)].
	odd ifTrue: [nr add: 16r0].
	1 to: nr size
	    by: 2
	    do: 
		[:each | 
		| low high |
		low := nr at: each.
		high := nr at: each + 1.
		data add: (low bitOr: (high bitShift: 4))]

]

{ #category : #gti }
SCCPGlobalTitle class >> gtiIndGTI [
	^1

]

{ #category : #gti }
SCCPGlobalTitle class >> gtiIndNoGTI [
	^0

]

{ #category : #gti }
SCCPGlobalTitle class >> gtiIndTransNumbrAndMore [
	^4

]

{ #category : #gti }
SCCPGlobalTitle class >> gtiIndTransNumbrPlanAndEnc [
	^3

]

{ #category : #gti }
SCCPGlobalTitle class >> gtiIndTransOnlyGTI [
	^2

]

{ #category : #creation }
SCCPGlobalTitle class >> initWith: gti_ind data: gti [
	self 
	    allSubclassesDo: [:each | each subType = gti_ind ifTrue: [^each initWith: gti]].
	^self error: ('Unhandled gti indicator: <1p>' expandMacrosWith: gti_ind)

]

{ #category : #creation }
SCCPGlobalTitle class >> map: aDigit [
	^(aDigit >= 0 and: [aDigit <= 9]) 
	    ifTrue: [(aDigit + 48) asCharacter]
	    ifFalse: [$N]

]

{ #category : #nai }
SCCPGlobalTitle class >> naiInternationalNumber [
	^4

]

{ #category : #nai }
SCCPGlobalTitle class >> naiNationalSign [
	^3

]

{ #category : #nai }
SCCPGlobalTitle class >> naiReservedNational [
	^2

]

{ #category : #nai }
SCCPGlobalTitle class >> naiSubscriber [
	^1

]

{ #category : #nai }
SCCPGlobalTitle class >> naiUnknown [
	^0

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npData [
	^3

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npGeneric [
	^2

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npISDN [
	^1

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npLand [
	^6

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npMaritime [
	^5

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npMobile [
	^7

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npTelex [
	^4

]

{ #category : #'numbering-plan' }
SCCPGlobalTitle class >> npUnknown [
	^0

]

{ #category : #parsing }
SCCPGlobalTitle class >> parseAddr: data encoding: aEnc [
	| odd split |
	(aEnc = 1 or: [aEnc = 2]) 
	    ifFalse: [^self error: 'Only BCD number encoding supported.'].
	split := OrderedCollection new.
	data do: 
		[:each | 
		split add: (self map: (each bitAnd: 16r0F)).
		split add: (self map: ((each bitAnd: 16rF0) bitShift: -4))].

	"Handle the odd case"
	aEnc = 1 ifTrue: [split removeLast].
	^String withAll: split

]

{ #category : #parsing }
SCCPGlobalTitle class >> unmap: aChar [
	| digit |
	digit := aChar asInteger.
	^(digit >= 48 and: [digit <= 57]) ifTrue: [digit - 48] ifFalse: [16rF]

]

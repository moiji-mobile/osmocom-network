"
I represent the Address Reference, e.g. the source
    or destination reference address as used for SCCP connections.
"
Class {
	#name : #SCCPAddrReference,
	#superclass : #Object,
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #encoding }
SCCPAddrReference class >> fromByteArray: anArray [
	"Parse from a ByteArray"

	| oct1 oct2 oct3 |
	oct1 := (anArray at: 1) bitShift: 0.
	oct2 := (anArray at: 2) bitShift: 8.
	oct3 := (anArray at: 3) bitShift: 16.
	^(oct1 bitOr: oct2) bitOr: oct3

]

{ #category : #encoding }
SCCPAddrReference class >> fromCData: anArray [
	"Parse from an CArray"

	| oct1 oct2 oct3 |
	oct1 := (anArray at: 0) bitShift: 0.
	oct2 := (anArray at: 1) bitShift: 8.
	oct3 := (anArray at: 2) bitShift: 16.
	^(oct1 bitOr: oct2) bitOr: oct3

]

{ #category : #encoding }
SCCPAddrReference class >> store: anAddress on: aMsg [
	"Store the threee bytes of an sccp address on a messagebuffer"
	aMsg putByte: ((anAddress bitAnd: 16r000000FF) bitShift: -0).
	aMsg putByte: ((anAddress bitAnd: 16r0000FF00) bitShift: -8).
	aMsg putByte: ((anAddress bitAnd: 16r00FF0000) bitShift: -16)

]

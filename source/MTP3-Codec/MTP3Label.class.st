"
I represent a Q.704 15.2 Label. Maybe I should use GSMBitField or such in the future.
"
Class {
	#name : #MTP3Label,
	#superclass : #MTP3Field,
	#instVars : [
		'dpc',
		'opc',
		'slc'
	],
	#category : #'MTP3-Codec'
}

{ #category : #'as yet unclassified' }
MTP3Label class >> parseFrom: aStream [
	| slc opc dpc tmp |
	tmp := aStream next: 4.

	"TODO: Use the GSMBitfield or a bitreader"
	slc := ((tmp at: 4) bitAnd: 16rF0) bitShift: -4.
	dpc := tmp first.
	dpc := dpc bitOr: ((tmp second bitAnd: 2r00111111) bitShift: 8).
	opc := tmp second bitShift: -6.
	opc := opc bitOr: (tmp third bitShift: 2).
	opc := opc bitOr: ((tmp fourth bitAnd: 2r00001111) bitShift: 10).
	^(MTP3Label new)
	    dpc: dpc;
	    opc: opc;
	    slc: slc;
	    yourself

]

{ #category : #accessing }
MTP3Label >> dpc [
	^dpc

]

{ #category : #creation }
MTP3Label >> dpc: aDpc [
	dpc := aDpc

]

{ #category : #accessing }
MTP3Label >> opc [
	^opc

]

{ #category : #creation }
MTP3Label >> opc: anOpc [
	opc := anOpc

]

{ #category : #accessing }
MTP3Label >> slc [
	^slc

]

{ #category : #creation }
MTP3Label >> slc: aSlc [
	slc := aSlc

]

{ #category : #encode }
MTP3Label >> writeOn: aBuffer [
	| data w_slc w_dpc w_opc |
	w_slc := slc bitAnd: 2r111.
	w_dpc := dpc bitAnd: 2r11111111111111.
	w_opc := opc bitAnd: 2r11111111111111.
	data := (w_dpc bitOr: (w_opc bitShift: 14)) 
		    bitOr: (w_slc bitShift: 14 + 14).
	aBuffer
	    putByte: ((data bitShift: 0) bitAnd: 16rFF);
	    putByte: ((data bitShift: -8) bitAnd: 16rFF);
	    putByte: ((data bitShift: -16) bitAnd: 16rFF);
	    putByte: ((data bitShift: -24) bitAnd: 16rFF)

]

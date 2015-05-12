"
I try to test the TLV Description
"
Class {
	#name : #TLVDescriptionTest,
	#superclass : #TestCase,
	#category : #'OsmoNetworkPrimitives-Tests'
}

{ #category : #'as yet unclassified' }
TLVDescriptionTest >> testNeedsTag [
	| tlv |
	tlv := (TLVDescription new)
		    tag: 16r23;
		    beTV;
		    beConditional;
		    yourself.
	self assert: tlv needsTag

]

{ #category : #'as yet unclassified' }
TLVDescriptionTest >> testTLVCreation [
	"Test default"

	| tlv |
	tlv := TLVDescription new.
	self
	    assert: tlv isMandatory;
	    deny: tlv isOptional.

	"Test update"
	tlv presenceKind: tlv class optional.
	self
	    assert: tlv isOptional;
	    deny: tlv isMandatory.
	tlv instVarName: #bla.
	self assert: tlv instVarName = #bla.
	tlv tag: 16r23.
	self assert: tlv tag = 16r23.
	tlv beLV.
	self
	    assert: tlv typeKind equals: #lv;
	    assert: tlv hasLength;
	    deny: tlv hasTag.
	tlv beTLV.
	self
	    assert: tlv typeKind equals: #tlv;
	    assert: tlv hasLength;
	    assert: tlv hasTag.
	tlv beTagOnly.
	self
	    assert: tlv typeKind equals: #tagOnly;
	    assert: tlv hasTag;
	    deny: tlv hasLength

]

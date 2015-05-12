"
I hold the SCCP message class constants and provide
    an easy way to create specific messages.
"
Class {
	#name : #SCCPHelper,
	#superclass : #Object,
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #creation }
SCCPHelper class >> createCR: src dest: dest data: aData [
	^(SCCPConnectionRequest 
	    initWith: src
	    dest: dest
	    data: aData) toMessage

]

{ #category : #creation }
SCCPHelper class >> createDT1: dst data: data [
	^(SCCPConnectionData initWith: dst data: data) toMessage

]

{ #category : #creation }
SCCPHelper class >> createRLSD: src dest: dest cause: cause [
	^(SCCPConnectionReleased 
	    initWithDst: dest
	    src: src
	    cause: cause) toMessage

]

{ #category : #constants }
SCCPHelper class >> msgAk [
	^16r08

]

{ #category : #constants }
SCCPHelper class >> msgCc [
	^16r02

]

{ #category : #constants }
SCCPHelper class >> msgCr [
	^16r01

]

{ #category : #constants }
SCCPHelper class >> msgCref [
	^16r03

]

{ #category : #constants }
SCCPHelper class >> msgDt1 [
	^16r06

]

{ #category : #constants }
SCCPHelper class >> msgDt2 [
	^16r07

]

{ #category : #constants }
SCCPHelper class >> msgEa [
	^16r0C

]

{ #category : #constants }
SCCPHelper class >> msgEd [
	^16r0B

]

{ #category : #constants }
SCCPHelper class >> msgErr [
	^16r0F

]

{ #category : #constants }
SCCPHelper class >> msgIt [
	^16r10

]

{ #category : #constants }
SCCPHelper class >> msgLudt [
	^16r13

]

{ #category : #constants }
SCCPHelper class >> msgLudts [
	^16r14

]

{ #category : #constants }
SCCPHelper class >> msgRlc [
	^16r05

]

{ #category : #constants }
SCCPHelper class >> msgRlsd [
	^16r04

]

{ #category : #constants }
SCCPHelper class >> msgRsc [
	^16r0E

]

{ #category : #constants }
SCCPHelper class >> msgRsr [
	^16r0D

]

{ #category : #constants }
SCCPHelper class >> msgUdt [
	^16r09

]

{ #category : #constants }
SCCPHelper class >> msgUdts [
	^16r0A

]

{ #category : #constants }
SCCPHelper class >> msgXudt [
	^16r11

]

{ #category : #constants }
SCCPHelper class >> msgXudts [
	^16r12

]

{ #category : #constants }
SCCPHelper class >> pncData [
	^16r0F

]

{ #category : #constants }
SCCPHelper class >> pncEoO [
	^16r00

]

{ #category : #constants }
SCCPHelper class >> pncSegmentation [
	^2r10000

]

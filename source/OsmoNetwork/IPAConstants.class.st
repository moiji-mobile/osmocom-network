"
I have the constants for the IPA protocol.
"
Class {
	#name : #IPAConstants,
	#superclass : #Object,
	#category : #'OsmoNetwork-IPA'
}

{ #category : #constants }
IPAConstants class >> idtagEquipVer [
	^16r04

]

{ #category : #constants }
IPAConstants class >> idtagIpaddr [
	^16r06

]

{ #category : #constants }
IPAConstants class >> idtagLocation1 [
	^16r02

]

{ #category : #constants }
IPAConstants class >> idtagLocation2 [
	^16r03

]

{ #category : #constants }
IPAConstants class >> idtagMacaddr [
	^16r07

]

{ #category : #constants }
IPAConstants class >> idtagSernr [
	^16r00

]

{ #category : #constants }
IPAConstants class >> idtagSwVersion [
	^16r05

]

{ #category : #constants }
IPAConstants class >> idtagUnit [
	^16r08

]

{ #category : #constants }
IPAConstants class >> idtagUnitName [
	^16r01

]

{ #category : #constants }
IPAConstants class >> msgIdAck [
	^16r06

]

{ #category : #constants }
IPAConstants class >> msgIdGet [
	^16r04

]

{ #category : #constants }
IPAConstants class >> msgIdResp [
	^16r05

]

{ #category : #constants }
IPAConstants class >> msgPing [
	^16r00

]

{ #category : #constants }
IPAConstants class >> msgPong [
	^16r01

]

{ #category : #constants }
IPAConstants class >> msgSCCP [
	^16rFF

]

{ #category : #'osmo-extension-constants' }
IPAConstants class >> osmoCtrl [
	^16r00

]

{ #category : #'as yet unclassified' }
IPAConstants class >> osmoGSUP [
	^16r05
]

{ #category : #'osmo-extension-constants' }
IPAConstants class >> osmoLac [
	^16r02

]

{ #category : #'osmo-extension-constants' }
IPAConstants class >> osmoMgcp [
	^16r01

]

{ #category : #constants }
IPAConstants class >> protocolIPA [
	^16rFE

]

{ #category : #constants }
IPAConstants class >> protocolMGCP [
	^16rFC

]

{ #category : #constants }
IPAConstants class >> protocolOML [
	^16rFF

]

{ #category : #constants }
IPAConstants class >> protocolOSMO [
	^16rEE

]

{ #category : #constants }
IPAConstants class >> protocolOsmoCTRL [
	^
	{self protocolOSMO.
	self osmoCtrl}

]

{ #category : #constants }
IPAConstants class >> protocolOsmoGSUP [
	^
	{self protocolOSMO.
	self osmoGSUP}

]

{ #category : #constants }
IPAConstants class >> protocolOsmoLAC [
	^
	{self protocolOSMO.
	self osmoLac}

]

{ #category : #constants }
IPAConstants class >> protocolOsmoMGCP [
	^
	{self protocolOSMO.
	self osmoMgcp}

]

{ #category : #constants }
IPAConstants class >> protocolRSL [
	^16r00

]

{ #category : #constants }
IPAConstants class >> protocolSCCP [
	^16rFD

]

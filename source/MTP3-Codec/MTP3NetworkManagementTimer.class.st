"
I represent the legal ranges from Q.704
"
Class {
	#name : #MTP3NetworkManagementTimer,
	#superclass : #Object,
	#category : #'MTP3-Codec'
}

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T1 [
	"Delay to avoid message mis-sequencing on changeover."
	^500 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T10 [
	"Waiting to repeat signalling route set test message.
	 The maximum value may be extended at the discretion of the management function in
	 certain situations, e.g. many signalling points being unavailable or signalling point of
	 known long term unavailability."
	^30000 to: 60000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T11 [
	"Transfer restricted timer. (This is one way of implementing the function described in
	 13.4 and mainly intended to simplify STPs.)"
	^30000 to: 90000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T12 [
	"Waiting for uninhibit acknowledgement."
	^800 to: 1500

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T13 [
	"Waiting for force uninhibit."
	^800 to: 1500

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T14 [
	"Waiting for inhibition acknowledgement."
	^2000 to: 3000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T15 [
	"Waiting to start signalling route set congestion test."
	^2000 to: 3000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T16 [
	"Waiting for route set congestion status update."
	^1400 to: 2000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T17 [
	"Delay to avoid oscillation of initial alignment failure and link restart."
	^800 to: 1500

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T18 [
	"Timer8 within a signalling point whose MTP restarts for supervising link and link set
	 activation as well as the receipt of routing information.
	 The value is implementation and network dependent.
	 Criteria to choose T18 are given in 9.2."
	^self notYetImplemented

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T19 [
	"Supervision timer during MTP restart to avoid possible ping-pong of TFP, TFR1 and
	 TRA messages."
	^67000 to: 69000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T2 [
	"Waiting for changeover acknowledgement."
	^700 to: 2000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T20 [
	"Overall MTP restart timer at the signalling point whose MTP restarts."
	^59000 to: 61000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T21 [
	"Overall MTP restart timer at a signalling point adjacent to one whose MTP restarts."
	^63000 to: 65000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T22 [
	"Local inhibit test timer."
	^3 * 60 * 1000 to: 6 * 60 * 1000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T23 [
	"Remote inhibit test timer."
	^3 * 60 * 1000 to: 6 * 60 * 1000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T24 [
	"Stabilising timer after removal of local processor outage, used in LPO latching to RPO
	 (national option)."
	^500 to: 500

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T3 [
	"Time controlled diversion-delay to avoid mis-sequencing on changeback."
	^500 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T4 [
	"Waiting for changeback acknowledgement (first attempt)."
	^500 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T5 [
	"Waiting for changeback acknowledgement (second attempt)."
	^500 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T6 [
	"Delay to avoid message mis-sequencing on controlled rerouting."
	^500 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T7 [
	"Waiting for signalling data link connection acknowledgement."
	^1000 to: 2000

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T8 [
	"Transfer prohibited inhibition timer (transient solution)."
	^800 to: 1200

]

{ #category : #'timer-ranges' }
MTP3NetworkManagementTimer class >> T9 [
	^self shouldNotImplement

]

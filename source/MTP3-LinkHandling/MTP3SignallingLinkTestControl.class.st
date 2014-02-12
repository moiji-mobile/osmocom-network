"
This implements Q.707 Signalling LinkTest Control (SLTC)

It is not doing much. It is responding to SLTM and it is SLTMs,
starts the timers and such.


"
Class {
	#name : #MTP3SignallingLinkTestControl,
	#superclass : #MTP3LinkHandlingBase,
	#instVars : [
		't1',
		't2',
		'attempt'
	],
	#category : #'MTP3-LinkHandling'
}

{ #category : #support }
MTP3SignallingLinkTestControl >> cancelTimers [
	t1 ifNotNil: [t1 cancel].
	t2 ifNotNil: [t2 cancel].
]

{ #category : #private }
MTP3SignallingLinkTestControl >> createLabel: slc [
	^MTP3Label new
		dpc: self linkSet dpc;
		opc: self linkSet opc;
		slc: slc;
		yourself
]

{ #category : #hmdt }
MTP3SignallingLinkTestControl >> dispatchSLTA: aMsg [ 
	t1 ifNotNil: [t1 cancel].
	aMsg testPattern asString = self testPattern
		ifFalse: [^self reattempt].
	aMsg label slc = self link physicalNumber
		ifFalse: [^self reattempt].
	aMsg label opc = self linkSet dpc
		ifFalse: [^self reattempt].
	self success.
]

{ #category : #hmdt }
MTP3SignallingLinkTestControl >> dispatchSLTM: aMsg [
	| slta label |
	aMsg label dpc = self linkSet opc ifFalse: [
		self logError: 'Addressed PC is not our OPC' area: #mtp3.
		^self].

	label := self createLabel: aMsg label slc.
	slta := MTP3SLTAMSG new
		service: self linkSet service;
		label: label;
		testPattern: aMsg testPattern;
		yourself.
	self hmrt signallingLinkTestControl: slta link: self link.
]

{ #category : #'state-machine' }
MTP3SignallingLinkTestControl >> failed [
	self scheduleNextTest.
	self signallingLinkActivityControl sltFailed.
]

{ #category : #support }
MTP3SignallingLinkTestControl >> isT1Running [
	^t1 isNil
		ifTrue: [false]
		ifFalse: [t1 isCanceled not].
]

{ #category : #'state-machine' }
MTP3SignallingLinkTestControl >> reattempt [
	attempt := attempt + 1.
	attempt > 2 ifTrue: [
		^self failed.
	].
	t1 cancel.
	t2 cancel.
	self runOnce.
]

{ #category : #private }
MTP3SignallingLinkTestControl >> runOnce [
	t2 ifNotNil: [t2 cancel].
	self sendSltm.
	t1 := TimerScheduler instance scheduleInSeconds: 10 block: [
		self reattempt.
	].
]

{ #category : #private }
MTP3SignallingLinkTestControl >> scheduleNextTest [
	t2 ifNotNil: [t2 cancel].
	t2 := TimerScheduler instance scheduleInSeconds: 60 block: [
		self start.
	].
]

{ #category : #'state-machine' }
MTP3SignallingLinkTestControl >> sendSltm [
	| sltm label |

	label := self createLabel: (self link physicalNumber).
	sltm := MTP3SLTMMSG new
		service: self linkSet service;
		label: label;
		testPattern: self testPattern asByteArray;
		yourself.
	self hmrt signallingLinkTestControl: sltm link: self link
]

{ #category : #private }
MTP3SignallingLinkTestControl >> signallingLinkActivityControl [
	^self link signallingLinkActivityControl
]

{ #category : #'Q.707' }
MTP3SignallingLinkTestControl >> signallingLinkTestControl: aMsg [
	aMsg dispatchForSignallingLinkTestControl: self.
]

{ #category : #mgmt }
MTP3SignallingLinkTestControl >> start [
	attempt := 1.
	self runOnce
]

{ #category : #'Q.704' }
MTP3SignallingLinkTestControl >> stop [
	"There is no stop message to the SLTC.. but on link failure we
	 need that. Otherwise we would need to always start the test
	procedure..."
	self cancelTimers.
]

{ #category : #'state-machine' }
MTP3SignallingLinkTestControl >> success [
	self scheduleNextTest.
	self signallingLinkActivityControl sltSuccessfull.
]

{ #category : #private }
MTP3SignallingLinkTestControl >> testPattern [
	"Only 11 chars are available..."
	^'HiSmalltalk'
]

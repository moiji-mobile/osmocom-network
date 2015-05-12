"
I hold the M2UA specific constants
"
Class {
	#name : #M2UAConstants,
	#superclass : #UAConstants,
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #constants }
M2UAConstants class >> actionRtrvBSN [
	^0

]

{ #category : #constants }
M2UAConstants class >> actionRtrvMSGs [
	^1

]

{ #category : #constants }
M2UAConstants class >> congLevel1 [
	^1

]

{ #category : #constants }
M2UAConstants class >> congLevel2 [
	^2

]

{ #category : #constants }
M2UAConstants class >> congLevel3 [
	^3

]

{ #category : #constants }
M2UAConstants class >> congLevelNone [
	^0

]

{ #category : #constants }
M2UAConstants class >> deregErrorInvIdent [
	^2

]

{ #category : #constants }
M2UAConstants class >> deregErrorNotReg [
	^4

]

{ #category : #constants }
M2UAConstants class >> deregErrorPermDenied [
	^3

]

{ #category : #constants }
M2UAConstants class >> deregErrorUnknown [
	^1

]

{ #category : #constants }
M2UAConstants class >> deregSuccess [
	^0

]

{ #category : #constants }
M2UAConstants class >> errAspActForIdent [
	^16

]

{ #category : #constants }
M2UAConstants class >> errAspIdentRequired [
	^14

]

{ #category : #constants }
M2UAConstants class >> errInvalidAspIdent [
	^15

]

{ #category : #constants }
M2UAConstants class >> errInvalidIdent [
	^2

]

{ #category : #constants }
M2UAConstants class >> errInvalidParamVal [
	^17

]

{ #category : #constants }
M2UAConstants class >> errInvalidStreamIdent [
	^9

]

{ #category : #constants }
M2UAConstants class >> errInvalidVersion [
	^1

]

{ #category : #constants }
M2UAConstants class >> errMissingParam [
	^22

]

{ #category : #constants }
M2UAConstants class >> errParamFieldError [
	^18

]

{ #category : #constants }
M2UAConstants class >> errProtocolError [
	^7

]

{ #category : #constants }
M2UAConstants class >> errRefused [
	^13

]

{ #category : #constants }
M2UAConstants class >> errUneMsg [
	^6

]

{ #category : #constants }
M2UAConstants class >> errUnexpParam [
	^19

]

{ #category : #constants }
M2UAConstants class >> errUnsInterIdentInt [
	^8

]

{ #category : #constants }
M2UAConstants class >> errUnsMsgClass [
	^3

]

{ #category : #constants }
M2UAConstants class >> errUnsMsgType [
	^4

]

{ #category : #constants }
M2UAConstants class >> errUnsTraMode [
	^5

]

{ #category : #constants }
M2UAConstants class >> errUnsued1 [
	^10

]

{ #category : #constants }
M2UAConstants class >> errUnsued2 [
	^11

]

{ #category : #constants }
M2UAConstants class >> errUnsued3 [
	^12

]

{ #category : #constants }
M2UAConstants class >> errUnused4 [
	^20

]

{ #category : #constants }
M2UAConstants class >> errUnused5 [
	^21

]

{ #category : #constants }
M2UAConstants class >> eventLPOEnter [
	^3

]

{ #category : #constants }
M2UAConstants class >> eventLPOExit [
	^4

]

{ #category : #constants }
M2UAConstants class >> eventRPOEnter [
	^1

]

{ #category : #constants }
M2UAConstants class >> eventRPOExit [
	^2

]

{ #category : #constants }
M2UAConstants class >> ntfyKindOther [
	^2

]

{ #category : #constants }
M2UAConstants class >> ntfyKindStateChange [
	^1

]

{ #category : #constants }
M2UAConstants class >> ntfyOtherAltAspActiv [
	^2

]

{ #category : #constants }
M2UAConstants class >> ntfyOtherAspFailure [
	^3

]

{ #category : #constants }
M2UAConstants class >> ntfyOtherInsuffRes [
	^1

]

{ #category : #constants }
M2UAConstants class >> ntfyStateASActive [
	^3

]

{ #category : #constants }
M2UAConstants class >> ntfyStateASInactive [
	^2

]

{ #category : #constants }
M2UAConstants class >> ntfyStateASPending [
	^4

]

{ #category : #constants }
M2UAConstants class >> regErrorInsuffRes [
	^8

]

{ #category : #constants }
M2UAConstants class >> regErrorInvLinkKey [
	^4

]

{ #category : #constants }
M2UAConstants class >> regErrorInvSDLI [
	^2

]

{ #category : #constants }
M2UAConstants class >> regErrorInvSDTI [
	^3

]

{ #category : #constants }
M2UAConstants class >> regErrorNotProvisioned [
	^7

]

{ #category : #constants }
M2UAConstants class >> regErrorOverlapKey [
	^6

]

{ #category : #constants }
M2UAConstants class >> regErrorPermDenied [
	^5

]

{ #category : #constants }
M2UAConstants class >> regErrorUnknown [
	^1

]

{ #category : #constants }
M2UAConstants class >> regSuccess [
	^0

]

{ #category : #constants }
M2UAConstants class >> resultFailure [
	^1

]

{ #category : #constants }
M2UAConstants class >> resultSuccess [
	^0

]

{ #category : #constants }
M2UAConstants class >> spare [
	^0

]

{ #category : #constants }
M2UAConstants class >> statusAudit [
	^7

]

{ #category : #constants }
M2UAConstants class >> statusClearRTB [
	^6

]

{ #category : #constants }
M2UAConstants class >> statusCongAccept [
	^9

]

{ #category : #constants }
M2UAConstants class >> statusCongCleared [
	^8

]

{ #category : #constants }
M2UAConstants class >> statusCongDisc [
	^10

]

{ #category : #constants }
M2UAConstants class >> statusContinue [
	^5

]

{ #category : #constants }
M2UAConstants class >> statusEmergClear [
	^3

]

{ #category : #constants }
M2UAConstants class >> statusEmergSet [
	^2

]

{ #category : #constants }
M2UAConstants class >> statusFlushBufs [
	^4

]

{ #category : #constants }
M2UAConstants class >> statusLpoClear [
	^1

]

{ #category : #constants }
M2UAConstants class >> statusLpoSet [
	^0

]

{ #category : #timerValues }
M2UAConstants class >> tack [
	^ 2
]

{ #category : #constants }
M2UAConstants class >> tagAction [
	^774

]

{ #category : #constants }
M2UAConstants class >> tagCongStatus [
	^772

]

{ #category : #constants }
M2UAConstants class >> tagData [
	^768

]

{ #category : #constants }
M2UAConstants class >> tagDataTTC [
	^769

]

{ #category : #constants }
M2UAConstants class >> tagDeregRes [
	^783

]

{ #category : #constants }
M2UAConstants class >> tagDeregStatus [
	^784

]

{ #category : #constants }
M2UAConstants class >> tagDiscStatus [
	^773

]

{ #category : #constants }
M2UAConstants class >> tagLinkKey [
	^777

]

{ #category : #constants }
M2UAConstants class >> tagLocLinkeyIdent [
	^778

]

{ #category : #constants }
M2UAConstants class >> tagRegRes [
	^781

]

{ #category : #constants }
M2UAConstants class >> tagRegStatus [
	^782

]

{ #category : #constants }
M2UAConstants class >> tagRetrRes [
	^776

]

{ #category : #constants }
M2UAConstants class >> tagSDL [
	^780

]

{ #category : #constants }
M2UAConstants class >> tagSDT [
	^779

]

{ #category : #constants }
M2UAConstants class >> tagSeqNo [
	^775

]

{ #category : #constants }
M2UAConstants class >> tagStateEvent [
	^771

]

{ #category : #constants }
M2UAConstants class >> tagStateReq [
	^770

]

{ #category : #timerValues }
M2UAConstants class >> tbeat [
	^ 30
]

{ #category : #timerValues }
M2UAConstants class >> tr [
	^ 2.
]

{ #category : #constants }
M2UAConstants class >> traBroadcast [
	^3

]

{ #category : #constants }
M2UAConstants class >> traLoadShare [
	^2

]

{ #category : #constants }
M2UAConstants class >> traOverride [
	^1

]

{ #category : #constants }
M2UAConstants class >> version [
	^1

]

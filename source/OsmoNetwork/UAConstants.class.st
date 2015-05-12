"
I hold the mapping from M2UA constants to their
    numeric representation. The following classes are defined:

    Management (MGMT) Message [IUA/UA/M3UA/SUA]
    Transfer Messages [M3UA]
    SS7 Signalling Network Management (SSNM) Messages [M3UA/SUA] 
    ASP State Maintenance (ASPSM) Messages [IUA/UA/M3UA/SUA]
    ASP Traffic Maintenance (ASPTM) Messages [IUA/UA/M3UA/SUA]
    Q.921/Q.931 Boundary Primitives Transport (QPTM)
    MTP2 User Adaptation (MAUP) Messages [UA]
    Connectionless Messages [SUA]
    Connection-Oriented Messages [SUA]
    Routing Key Management (RKM) Messages (M3UA)
    Interface Identifier Management (IIM) Messages (UA)
        
"
Class {
	#name : #UAConstants,
	#superclass : #Object,
	#category : #M2UA
}

{ #category : #constants }
UAConstants class >> aspsmBeat [
	^3

]

{ #category : #constants }
UAConstants class >> aspsmBeatAck [
	^6

]

{ #category : #constants }
UAConstants class >> aspsmDown [
	^2

]

{ #category : #constants }
UAConstants class >> aspsmDownAck [
	^5

]

{ #category : #constants }
UAConstants class >> aspsmReserved [
	^0

]

{ #category : #constants }
UAConstants class >> aspsmUp [
	^1

]

{ #category : #constants }
UAConstants class >> aspsmUpAck [
	^4

]

{ #category : #constants }
UAConstants class >> asptmActiv [
	^1

]

{ #category : #constants }
UAConstants class >> asptmActivAck [
	^3

]

{ #category : #constants }
UAConstants class >> asptmInactiv [
	^2

]

{ #category : #constants }
UAConstants class >> asptmInactivAck [
	^4

]

{ #category : #constants }
UAConstants class >> asptmReserved [
	^0

]

{ #category : #constants }
UAConstants class >> clasIIM [
	^10

]

{ #category : #constants }
UAConstants class >> clsASPSM [
	^3

]

{ #category : #constants }
UAConstants class >> clsASPTM [
	^4

]

{ #category : #constants }
UAConstants class >> clsMAUP [
	^6

]

{ #category : #constants }
UAConstants class >> clsMgmt [
	^0

]

{ #category : #constants }
UAConstants class >> clsQPTM [
	^5

]

{ #category : #constants }
UAConstants class >> clsRKM [
	^9

]

{ #category : #constants }
UAConstants class >> clsSSMN [
	^2

]

{ #category : #constants }
UAConstants class >> clsSUA_CONN [
	^8

]

{ #category : #constants }
UAConstants class >> clsSUA_LESS [
	^7

]

{ #category : #constants }
UAConstants class >> clsTrans [
	^1

]

{ #category : #constants }
UAConstants class >> iimDeregReq [
	^3

]

{ #category : #constants }
UAConstants class >> iimDeregResp [
	^4

]

{ #category : #constants }
UAConstants class >> iimRegReq [
	^1

]

{ #category : #constants }
UAConstants class >> iimRegRsp [
	^2

]

{ #category : #constants }
UAConstants class >> iimReserved [
	^0

]

{ #category : #constants }
UAConstants class >> maupCongInd [
	^14

]

{ #category : #constants }
UAConstants class >> maupDRetrCompl [
	^13

]

{ #category : #constants }
UAConstants class >> maupDRetrCon [
	^11

]

{ #category : #constants }
UAConstants class >> maupDRetrInd [
	^12

]

{ #category : #constants }
UAConstants class >> maupDRetrReq [
	^10

]

{ #category : #constants }
UAConstants class >> maupData [
	^1

]

{ #category : #constants }
UAConstants class >> maupDataAck [
	^15

]

{ #category : #constants }
UAConstants class >> maupEstCon [
	^3

]

{ #category : #constants }
UAConstants class >> maupEstReq [
	^2

]

{ #category : #constants }
UAConstants class >> maupRelCon [
	^5

]

{ #category : #constants }
UAConstants class >> maupRelInd [
	^6

]

{ #category : #constants }
UAConstants class >> maupRelReq [
	^4

]

{ #category : #constants }
UAConstants class >> maupReserved [
	^0

]

{ #category : #constants }
UAConstants class >> maupStateCon [
	^8

]

{ #category : #constants }
UAConstants class >> maupStateInd [
	^9

]

{ #category : #constants }
UAConstants class >> maupStateReq [
	^7

]

{ #category : #constants }
UAConstants class >> mgmtError [
	^0

]

{ #category : #constants }
UAConstants class >> mgmtNtfy [
	^1

]

{ #category : #constants }
UAConstants class >> tagAspIdent [
	^17

]

{ #category : #constants }
UAConstants class >> tagBeatData [
	^9

]

{ #category : #constants }
UAConstants class >> tagCorrelId [
	^19

]

{ #category : #constants }
UAConstants class >> tagDiagInf [
	^7

]

{ #category : #constants }
UAConstants class >> tagErrCode [
	^12

]

{ #category : #constants }
UAConstants class >> tagIdentInt [
	^1

]

{ #category : #constants }
UAConstants class >> tagIdentRange [
	^8

]

{ #category : #constants }
UAConstants class >> tagIdentText [
	^3

]

{ #category : #constants }
UAConstants class >> tagInfo [
	^4

]

{ #category : #constants }
UAConstants class >> tagReserved [
	^0

]

{ #category : #constants }
UAConstants class >> tagStatus [
	^13

]

{ #category : #constants }
UAConstants class >> tagTraMode [
	^11

]

{ #category : #constants }
UAConstants class >> tagUnused1 [
	^2

]

{ #category : #constants }
UAConstants class >> tagUnused2 [
	^5

]

{ #category : #constants }
UAConstants class >> tagUnused3 [
	^6

]

{ #category : #constants }
UAConstants class >> tagUnused4 [
	^10

]

{ #category : #constants }
UAConstants class >> tagUnused5 [
	^14

]

{ #category : #constants }
UAConstants class >> tagUnused6 [
	^15

]

{ #category : #constants }
UAConstants class >> tagUnused7 [
	^16

]

{ #category : #constants }
UAConstants class >> tagUnused8 [
	^18

]

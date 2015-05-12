"
Constants for the ISDN User Part (ISUP) protocol
"
Class {
	#name : #ISUPConstants,
	#superclass : #Object,
	#category : #ISUP
}

{ #category : #'constants-address' }
ISUPConstants class >> addrNAT_INTERNATIONAL [
	"International number"
	^2r0000100

]

{ #category : #'constants-address' }
ISUPConstants class >> addrNAT_NATIONAL [
	"National (significant) number"
	^2r0000011

]

{ #category : #constants }
ISUPConstants class >> msgACM [
	"Address complete"
	^2r00000110

]

{ #category : #constants }
ISUPConstants class >> msgAMN [
	"Answer"
	^2r00001001

]

{ #category : #constants }
ISUPConstants class >> msgAPT [
	"Application transport"
	^2r01000001

]

{ #category : #constants }
ISUPConstants class >> msgBLA [
	"Blocking acknowledgement"
	^2r00010101

]

{ #category : #constants }
ISUPConstants class >> msgBLO [
	"Blocking"
	^2r00010011

]

{ #category : #constants }
ISUPConstants class >> msgCCR [
	"Continuity check request"
	^2r00010001

]

{ #category : #constants }
ISUPConstants class >> msgCFN [
	"Confusion"
	^2r00101111

]

{ #category : #constants }
ISUPConstants class >> msgCGB [
	"Circuit group blocking"
	^2r00011000

]

{ #category : #constants }
ISUPConstants class >> msgCGBA [
	"Circuit group blocking acknowledgement"
	^2r00011010

]

{ #category : #constants }
ISUPConstants class >> msgCGU [
	"Circuit group unblocking"
	^2r00011001

]

{ #category : #constants }
ISUPConstants class >> msgCGUA [
	"Circuit group unblocking acknowledgement"
	^2r00011011

]

{ #category : #constants }
ISUPConstants class >> msgCON [
	"Connect"
	^2r00000111

]

{ #category : #constants }
ISUPConstants class >> msgCOT [
	"Continuity"
	^2r00000101

]

{ #category : #constants }
ISUPConstants class >> msgCPG [
	"Call progress"
	^2r00101100

]

{ #category : #constants }
ISUPConstants class >> msgCQM [
	"Circuit group query"
	^2r00101010

]

{ #category : #constants }
ISUPConstants class >> msgCQR [
	"Circuit group query response"
	^2r00101011

]

{ #category : #constants }
ISUPConstants class >> msgCRG [
	"Charge information"
	^2r00110001

]

{ #category : #constants }
ISUPConstants class >> msgDRS [
	"Delayed release (reserved ‚Äì used in 1988 version)"
	^2r00100111

]

{ #category : #constants }
ISUPConstants class >> msgFAA [
	"Facility accepted"
	^2r00100000

]

{ #category : #constants }
ISUPConstants class >> msgFAC [
	"Facility"
	^2r00110011

]

{ #category : #constants }
ISUPConstants class >> msgFAR [
	"Facility request"
	^2r00011111

]

{ #category : #constants }
ISUPConstants class >> msgFOT [
	"Forward transfer"
	^2r00001000

]

{ #category : #constants }
ISUPConstants class >> msgFRJ [
	"Facility reject"
	^2r00100001

]

{ #category : #constants }
ISUPConstants class >> msgGRA [
	"Circuit group reset acknowledgement"
	^2r00101001

]

{ #category : #constants }
ISUPConstants class >> msgGRS [
	"Circuit group reset"
	^2r00010111

]

{ #category : #constants }
ISUPConstants class >> msgIAM [
	"Initial address"
	^2r00000001

]

{ #category : #constants }
ISUPConstants class >> msgIDR [
	"Identification request"
	^2r00110110

]

{ #category : #constants }
ISUPConstants class >> msgIDS [
	"Identification response"
	^2r00110111

]

{ #category : #constants }
ISUPConstants class >> msgINF [
	"Information"
	^2r00000100

]

{ #category : #constants }
ISUPConstants class >> msgINR [
	"Information request"
	^2r00000011

]

{ #category : #constants }
ISUPConstants class >> msgLPA [
	"Loop back acknowledgement"
	^2r00100100

]

{ #category : #constants }
ISUPConstants class >> msgLPR [
	"Loop prevention"
	^2r01000000

]

{ #category : #constants }
ISUPConstants class >> msgNRM [
	"Network resource management"
	^2r00110010

]

{ #category : #constants }
ISUPConstants class >> msgOLM [
	"Overload"
	^2r00110000

]

{ #category : #constants }
ISUPConstants class >> msgPAM [
	"Pass-along"
	^2r00101000

]

{ #category : #constants }
ISUPConstants class >> msgPRI [
	"Pre-release information"
	^2r01000010

]

{ #category : #constants }
ISUPConstants class >> msgREL [
	"Release"
	^2r00001100

]

{ #category : #constants }
ISUPConstants class >> msgRES [
	"Resume"
	^2r00001110

]

{ #category : #constants }
ISUPConstants class >> msgRLC [
	"Release complete"
	^2r00010000

]

{ #category : #constants }
ISUPConstants class >> msgRSC [
	"Reset circuit"
	^2r00010010

]

{ #category : #constants }
ISUPConstants class >> msgSAM [
	"Subsequent address"
	^2r00000010

]

{ #category : #constants }
ISUPConstants class >> msgSAN [
	"Subsequent Directory Number"
	^2r01000011

]

{ #category : #constants }
ISUPConstants class >> msgSEG [
	"Segmentation"
	^2r00111000

]

{ #category : #constants }
ISUPConstants class >> msgSUS [
	"Suspend"
	^2r00001101

]

{ #category : #constants }
ISUPConstants class >> msgUBA [
	"Unblocking acknowledgement"
	^2r00010110

]

{ #category : #constants }
ISUPConstants class >> msgUBL [
	"Unblocking"
	^2r00010100

]

{ #category : #constants }
ISUPConstants class >> msgUCIC [
	"Unequipped circuit identification code"
	^2r00101110

]

{ #category : #constants }
ISUPConstants class >> msgUPA [
	"User Part available"
	^2r00110100

]

{ #category : #constants }
ISUPConstants class >> msgUPT [
	"User Part test"
	^2r00110100

]

{ #category : #constants }
ISUPConstants class >> msgUSR [
	"User-to-user information"
	^2r00101101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parAccessDeliveryInformation [
	^2r00101110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parAccessTransport [
	^2r00000011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parApplicationTransportParameter [
	^2r01111000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parAutomaticCongestionLevel [
	^2r00100111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parBackwardCallIndicators [
	^2r00010001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parBackwardGVNS [
	^2r01001101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCCNRPossibleIndicator [
	^2r01111010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCCSS [
	^2r01001011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallDiversionInformation [
	^2r00110110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallDiversionTreatmentIndicators [
	^2r01101110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallHistoryInformation [
	^2r00101101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallOfferingTreatmentIndicators [
	^2r01110000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallReference [
	^2r00000001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallTransferNumber [
	^2r01000101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallTransferReference [
	^2r01000011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCalledDirectoryNumber [
	^2r01111101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCalledINNumber [
	^2r01101111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCalledPartyNumber [
	^2r00000100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallingGeodeticLocation [
	^2r10000001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallingPartyNumber [
	^2r00001010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCallingPartysCategory [
	^2r00001001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCauseIndicators [
	^2r00010010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parChargedPartyIdentification [
	^2r01110001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCircuitAssignmentMap [
	^2r00100101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCircuitGroupSupervisionMessageType [
	^2r00010101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCircuitStateIndicator [
	^2r00100110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parClosedUserGroupInterlockCode [
	^2r00011010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCollectCallRequest [
	^2r01111001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parConferenceTreatmentIndicators [
	^2r01110010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parConnectedNumber [
	^2r00100001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parConnectionRequest [
	^2r00001101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parContinuityIndicators [
	^2r00010000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parCorrelationId [
	^2r01100101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parDisplayInformation [
	^2r01110011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parEchoControlInformation [
	^2r00110111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parEndOfOptionalParameters [
	^2r00000000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parEventInformation [
	^2r00100100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parFacilityIndicator [
	^2r00011000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parForwardCallIndicators [
	^2r00000111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parForwardGVNS [
	^2r01001100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parGenericDigits [
	^2r11000001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parGenericNotificationIndicator [
	^2r00101100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parGenericNumber [
	^2r11000000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parGenericReference [
	^2r10000010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parHTRInformation [
	^2r10000010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parHopCounter [
	^2r00111101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parInformationIndicators [
	^2r00001111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parInformationRequestIndicators [
	^2r00001110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parLocationNumber [
	^2r00111111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parLoopPreventionIndicators [
	^2r01000100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parMCIDRequestIndicators [
	^2r00111011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parMCIDResponseIndicators [
	^2r00111100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parMLPPPrecedence [
	^2r00111010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parMessageCompatibilityInformation [
	^2r00111000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parNatureOfConnectionIndicators [
	^2r00000110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parNetworkManagementControls [
	^2r01011011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parNetworkRoutingNumber [
	^2r10000100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parNetworkSpecificFacility [
	^2r00101111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parNumberPortabilityForwardInformation [
	^2r10001101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parOptionalBackwardCallIndicators [
	^2r00101001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parOptionalForwardCallIndicators [
	^2r00001000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parOriginalCalledINNumber [
	^2r01111111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parOriginalCalledNumber [
	^2r00101000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parOriginationISCPointCode [
	^2r00101011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parParameterCompatibilityInformation [
	^2r00111001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotCapability [
	^2r01111011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotCounter [
	^2r10000111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotRoutingBackwardInformation [
	^2r10001001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotRoutingForwardInformation [
	^2r10001000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotRoutingIndicators [
	^2r01111100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPivotStatus [
	^2r10000110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parPropagationDelayCounter [
	^2r00110001

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parQoRCapability [
	^2r10000101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRange [
	^2r00010110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRangeAndStatus [
	^2r00010110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectBackwardInformation [
	^2r10001100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectCapability [
	^2r01001110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectCounter [
	^2r01110111

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectForwardInformation [
	^2r10001011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectStatus [
	^2r10001010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectingNumber [
	^2r00001011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectionInformation [
	^2r00010011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectionNumber [
	^2r00001100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRedirectionNumberRestriction [
	^2r01000000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parRemoteOperations [
	^2r00110010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parSCFId [
	^2r01100110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parServiceActivation [
	^2r00110011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parSignallingPointCode [
	^2r00011110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parSubsequentNumber [
	^2r00000101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parSuspendResumeIndicators [
	^2r00100010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parTransitNetworkSelection [
	^2r00100011

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parTransmissionMediumRequirement [
	^2r00000010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parTransmissionMediumRequirementPrime [
	^2r00111110

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parTransmissionMediumUsed [
	^2r00110101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUIDActionIndicators [
	^2r01110100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUIDCapabilityIndicators [
	^2r01110101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUserServiceInformation [
	^2r00011101

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUserServiceInformationPrime [
	^2r00110000

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUserTeleserviceInformation [
	^2r00110100

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUserToUserIndicators [
	^2r00101010

]

{ #category : #'constants-Q767' }
ISUPConstants class >> parUserToUserInformation [
	^2r00100000

]

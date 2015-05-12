"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCPG,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCPG class >> tlvDescription [
	^(self initWith: ISUPConstants msgCPG)
	    addFixed: ISUPEventInformation;
	    addOptional: ISUPCauseIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPBackwardCallIndicators;
	    addOptional: ISUPOptionalBackwardCallIndicators;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPRedirectionNumber;
	    addOptional: ISUPUserToUserInformation;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPTransmissionMediumUsed;
	    addOptional: ISUPAccessDeliveryInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPCallDiversionInformation;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPRedirectionNumberRestriction;
	    addOptional: ISUPCallTransferNumber;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPConnectedNumber;
	    addOptional: ISUPBackwardGVNS;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPCallHistoryInformation;
	    addOptional: ISUPConferenceTreatmentIndicators;
	    addOptional: ISUPUIDActionIndicators;
	    addOptionals: ISUPApplicationTransportParameter;
	    addOptional: ISUPCCNRPossibleIndicator;
	    addOptional: ISUPPivotRoutingBackwardInformation;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

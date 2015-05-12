"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPACM,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPACM class >> tlvDescription [
	^(self initWith: ISUPConstants msgACM)
	    addFixed: ISUPBackwardCallIndicators;
	    addOptional: ISUPOptionalBackwardCallIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPCauseIndicators;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPAccessTransport;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPTransmissionMediumUsed;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPAccessDeliveryInformation;
	    addOptional: ISUPRedirectionNumber;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPCallDiversionInformation;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPRedirectionNumberRestriction;
	    addOptional: ISUPConferenceTreatmentIndicators;
	    addOptional: ISUPUIDActionIndicators;
	    addOptionals: ISUPApplicationTransportParameter;
	    addOptional: ISUPCCNRPossibleIndicator;
	    addOptional: ISUPHTRInformation;
	    addOptional: ISUPPivotRoutingBackwardInformation;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

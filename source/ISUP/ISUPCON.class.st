"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCON,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCON class >> tlvDescription [
	^(self initWith: ISUPConstants msgCON)
	    addFixed: ISUPBackwardCallIndicators;
	    addOptional: ISUPOptionalBackwardCallIndicators;
	    addOptional: ISUPBackwardGVNS;
	    addOptional: ISUPConnectedNumber;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPTransmissionMediumUsed;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPAccessDeliveryInformation;
	    addOptional: ISUPCallHistoryInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPRedirectionNumberRestriction;
	    addOptional: ISUPConferenceTreatmentIndicators;
	    addOptionals: ISUPApplicationTransportParameter;
	    addOptional: ISUPHTRInformation;
	    addOptional: ISUPPivotRoutingBackwardInformation;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

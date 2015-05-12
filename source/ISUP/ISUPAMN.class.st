"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPAMN,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPAMN class >> tlvDescription [
	^(self initWith: ISUPConstants msgAMN)
	    addOptional: ISUPBackwardCallIndicators;
	    addOptional: ISUPOptionalBackwardCallIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPConnectedNumber;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPAccessDeliveryInformation;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPBackwardGVNS;
	    addOptional: ISUPCallHistoryInformation;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPTransmissionMediumUsed;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPRedirectionNumber;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPRedirectionNumberRestriction;
	    addOptional: ISUPDisplayInformation;
	    addOptional: ISUPConferenceTreatmentIndicators;
	    addOptionals: ISUPApplicationTransportParameter;
	    addOptional: ISUPPivotRoutingBackwardInformation;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

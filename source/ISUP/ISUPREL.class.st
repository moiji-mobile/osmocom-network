"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPREL,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPREL class >> tlvDescription [
	^(self initWith: ISUPConstants msgREL)
	    addVariable: ISUPCauseIndicators;
	    addOptional: ISUPRedirectionInformation;
	    addOptional: ISUPRedirectionNumber;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPSignallingPointCode;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPAutomaticCongestionLevel;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPAccessDeliveryInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPDisplayInformation;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPHTRInformation;
	    addOptional: ISUPRedirectCounter;
	    addOptional: ISUPRedirectBackwardInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

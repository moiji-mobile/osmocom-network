"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPFAC,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPFAC class >> tlvDescription [
	^(self initWith: ISUPConstants msgFAC)
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPCallTransferNumber;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPGenericNotificationIndicator;
	    addOptional: ISUPRedirectionNumber;
	    addOptional: ISUPPivotRoutingIndicators;
	    addOptional: ISUPPivotStatus;
	    addOptional: ISUPPivotCounter;
	    addOptional: ISUPPivotRoutingBackwardInformation;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

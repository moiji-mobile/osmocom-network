"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPIAM,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPIAM class >> tlvDescription [
	^(self initWith: ISUPConstants msgIAM)
	    addFixed: ISUPNatureOfConnectionIndicators;
	    addFixed: ISUPForwardCallIndicators;
	    addFixed: ISUPCallingPartysCategory;
	    addFixed: ISUPTransmissionMediumRequirement;
	    addVariable: ISUPCalledPartyNumber;
	    addOptional: ISUPTransitNetworkSelection;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPCallingPartyNumber;
	    addOptional: ISUPOptionalForwardCallIndicators;
	    addOptional: ISUPRedirectingNumber;
	    addOptional: ISUPRedirectionInformation;
	    addOptional: ISUPClosedUserGroupInterlockCode;
	    addOptional: ISUPConnectionRequest;
	    addOptional: ISUPOriginalCalledNumber;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPUserServiceInformation;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPPropagationDelayCounter;
	    addOptional: ISUPUserServiceInformationPrime;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptionals: ISUPGenericDigits;
	    addOptional: ISUPOriginationISCPointCode;
	    addOptional: ISUPUserTeleserviceInformation;
	    addOptional: ISUPRemoteOperations;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPServiceActivation;
	    addOptional: ISUPGenericReference;
	    addOptional: ISUPMLPPPrecedence;
	    addOptional: ISUPTransmissionMediumRequirementPrime;
	    addOptional: ISUPLocationNumber;
	    addOptional: ISUPForwardGVNS;
	    addOptional: ISUPCCSS;
	    addOptional: ISUPNetworkManagementControls;
	    addOptional: ISUPCircuitAssignmentMap;
	    addOptional: ISUPCorrelationId;
	    addOptional: ISUPCallDiversionTreatmentIndicators;
	    addOptional: ISUPCalledINNumber;
	    addOptional: ISUPCallOfferingTreatmentIndicators;
	    addOptional: ISUPConferenceTreatmentIndicators;
	    addOptional: ISUPSCFId;
	    addOptional: ISUPUIDCapabilityIndicators;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPHopCounter;
	    addOptional: ISUPCollectCallRequest;
	    addOptionals: ISUPApplicationTransportParameter;
	    addOptional: ISUPPivotCapability;
	    addOptional: ISUPCalledDirectoryNumber;
	    addOptional: ISUPOriginalCalledINNumber;
	    addOptional: ISUPCallingGeodeticLocation;
	    addOptional: ISUPNetworkRoutingNumber;
	    addOptional: ISUPQoRCapability;
	    addOptional: ISUPPivotCounter;
	    addOptional: ISUPPivotRoutingForwardInformation;
	    addOptional: ISUPRedirectCapability;
	    addOptional: ISUPRedirectCounter;
	    addOptional: ISUPRedirectStatus;
	    addOptional: ISUPRedirectForwardInformation;
	    addOptional: ISUPNumberPortabilityForwardInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

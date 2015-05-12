"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPIDS,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPIDS class >> tlvDescription [
	^(self initWith: ISUPConstants msgIDS)
	    addOptional: ISUPMCIDResponseIndicators;
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPCallingPartyNumber;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPChargedPartyIdentification;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

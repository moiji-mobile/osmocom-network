"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPINF,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPINF class >> tlvDescription [
	^(self initWith: ISUPConstants msgINF)
	    addFixed: ISUPInformationIndicators;
	    addOptional: ISUPCallingPartysCategory;
	    addOptional: ISUPCallingPartyNumber;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPConnectionRequest;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

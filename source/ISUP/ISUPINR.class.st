"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPINR,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPINR class >> tlvDescription [
	^(self initWith: ISUPConstants msgINR)
	    addFixed: ISUPInformationRequestIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPNetworkSpecificFacility;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

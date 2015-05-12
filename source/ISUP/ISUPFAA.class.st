"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPFAA,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPFAA class >> tlvDescription [
	^(self initWith: ISUPConstants msgFAA)
	    addFixed: ISUPFacilityIndicator;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPConnectionRequest;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

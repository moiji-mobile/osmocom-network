"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPIDR,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPIDR class >> tlvDescription [
	^(self initWith: ISUPConstants msgIDR)
	    addOptional: ISUPMCIDRequestIndicators;
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

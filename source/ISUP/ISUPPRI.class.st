"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPPRI,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPPRI class >> tlvDescription [
	^(self initWith: ISUPConstants msgPRI)
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptionals: ISUPOptionalForwardCallIndicators;
	    addOptionals: ISUPOptionalBackwardCallIndicators;
	    addOptional: ISUPApplicationTransportParameter;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

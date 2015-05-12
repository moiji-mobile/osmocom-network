"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPAPT,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPAPT class >> tlvDescription [
	^(self initWith: ISUPConstants msgAPT)
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPApplicationTransportParameter;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

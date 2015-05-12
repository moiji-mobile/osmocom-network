"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPNRM,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPNRM class >> tlvDescription [
	^(self initWith: ISUPConstants msgNRM)
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPEchoControlInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

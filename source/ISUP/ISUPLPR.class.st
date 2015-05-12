"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPLPR,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPLPR class >> tlvDescription [
	^(self initWith: ISUPConstants msgLPR)
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPCallTransferReference;
	    addOptional: ISUPLoopPreventionIndicators;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

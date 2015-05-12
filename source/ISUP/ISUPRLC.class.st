"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPRLC,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPRLC class >> tlvDescription [
	^(self initWith: ISUPConstants msgRLC)
	    addOptional: ISUPCauseIndicators;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

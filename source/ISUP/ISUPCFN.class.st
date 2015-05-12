"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCFN,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCFN class >> tlvDescription [
	^(self initWith: ISUPConstants msgCFN)
	    addVariable: ISUPCauseIndicators;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

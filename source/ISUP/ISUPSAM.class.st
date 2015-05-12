"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPSAM,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPSAM class >> tlvDescription [
	^(self initWith: ISUPConstants msgSAM)
	    addVariable: ISUPSubsequentNumber;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPSAN,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPSAN class >> tlvDescription [
	^(self initWith: ISUPConstants msgSAN)
	    addOptional: ISUPSubsequentNumber;
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPUSR,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPUSR class >> tlvDescription [
	^(self initWith: ISUPConstants msgUSR)
	    addVariable: ISUPUserToUserInformation;
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

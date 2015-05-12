"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPSEG,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPSEG class >> tlvDescription [
	^(self initWith: ISUPConstants msgSEG)
	    addOptional: ISUPAccessTransport;
	    addOptional: ISUPUserToUserInformation;
	    addOptional: ISUPMessageCompatibilityInformation;
	    addOptionals: ISUPGenericDigits;
	    addOptionals: ISUPGenericNotificationIndicator;
	    addOptional: ISUPGenericNumber;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

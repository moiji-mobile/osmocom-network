"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPUPT,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPUPT class >> tlvDescription [
	^(self initWith: ISUPConstants msgUPT)
	    addOptional: ISUPParameterCompatibilityInformation;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

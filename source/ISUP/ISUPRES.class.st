"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPRES,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPRES class >> tlvDescription [
	^(self initWith: ISUPConstants msgRES)
	    addFixed: ISUPSuspendResumeIndicators;
	    addOptional: ISUPCallReference;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

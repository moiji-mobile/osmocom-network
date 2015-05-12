"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPFOT,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPFOT class >> tlvDescription [
	^(self initWith: ISUPConstants msgFOT)
	    addOptional: ISUPCallReference;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

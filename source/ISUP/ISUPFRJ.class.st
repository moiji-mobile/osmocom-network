"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPFRJ,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPFRJ class >> tlvDescription [
	^(self initWith: ISUPConstants msgFRJ)
	    addFixed: ISUPFacilityIndicator;
	    addVariable: ISUPCauseIndicators;
	    addOptional: ISUPUserToUserIndicators;
	    addOptional: ISUPEndOfOptionalParameters;
	    yourself

]

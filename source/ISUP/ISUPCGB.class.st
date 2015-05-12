"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCGB,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCGB class >> tlvDescription [
	^(self initWith: ISUPConstants msgCGB)
	    addFixed: ISUPCircuitGroupSupervisionMessageType;
	    addVariable: ISUPRangeAndStatus;
	    yourself

]

"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCOT,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCOT class >> tlvDescription [
	^(self initWith: ISUPConstants msgCOT)
	    addFixed: ISUPContinuityIndicators;
	    yourself

]

"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPCQR,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPCQR class >> tlvDescription [
	^(self initWith: ISUPConstants msgCQR)
	    addVariable: ISUPRange;
	    addVariable: ISUPCircuitStateIndicator;
	    yourself

]

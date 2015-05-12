"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPCCR,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPCCR class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgCCR;
	    yourself

]

"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPFAR,
	#superclass : #ISUPFAA,
	#category : #ISUP
}

{ #category : #field }
ISUPFAR class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgFAR;
	    yourself

]

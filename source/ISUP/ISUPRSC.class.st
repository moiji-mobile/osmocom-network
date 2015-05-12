"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPRSC,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPRSC class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgRSC;
	    yourself

]

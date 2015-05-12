"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPUCIC,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPUCIC class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgUCIC;
	    yourself

]

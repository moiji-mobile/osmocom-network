"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPLPA,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPLPA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgLPA;
	    yourself

]

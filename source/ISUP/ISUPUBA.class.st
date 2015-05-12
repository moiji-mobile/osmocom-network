"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPUBA,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPUBA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgUBA;
	    yourself

]

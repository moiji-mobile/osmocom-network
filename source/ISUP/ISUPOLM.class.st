"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPOLM,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPOLM class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgOLM;
	    yourself

]

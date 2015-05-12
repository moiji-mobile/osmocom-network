"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPUBL,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPUBL class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgUBL;
	    yourself

]

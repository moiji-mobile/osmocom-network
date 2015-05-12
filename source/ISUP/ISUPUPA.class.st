"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPUPA,
	#superclass : #ISUPUPT,
	#category : #ISUP
}

{ #category : #field }
ISUPUPA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgUPA;
	    yourself

]

"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPSUS,
	#superclass : #ISUPRES,
	#category : #ISUP
}

{ #category : #field }
ISUPSUS class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgSUS;
	    yourself

]

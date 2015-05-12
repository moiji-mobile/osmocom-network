"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPGRA,
	#superclass : #ISUPGRS,
	#category : #ISUP
}

{ #category : #field }
ISUPGRA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgGRA;
	    yourself

]

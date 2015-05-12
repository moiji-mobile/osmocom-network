"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPBLA,
	#superclass : #ISUPBLO,
	#category : #ISUP
}

{ #category : #field }
ISUPBLA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgBLA;
	    yourself

]

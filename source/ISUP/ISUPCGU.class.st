"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPCGU,
	#superclass : #ISUPCGB,
	#category : #ISUP
}

{ #category : #field }
ISUPCGU class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgCGU;
	    yourself

]

"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPCGUA,
	#superclass : #ISUPCGB,
	#category : #ISUP
}

{ #category : #field }
ISUPCGUA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgCGUA;
	    yourself

]

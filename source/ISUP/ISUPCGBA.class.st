"
I am an auto generated ISUP message.
"
Class {
	#name : #ISUPCGBA,
	#superclass : #ISUPCGB,
	#category : #ISUP
}

{ #category : #field }
ISUPCGBA class >> tlvDescription [
	^(super tlvDescription)
	    type: ISUPConstants msgCGBA;
	    yourself

]

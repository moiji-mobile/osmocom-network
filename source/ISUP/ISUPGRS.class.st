"
I am auto-generated ISUP message.
"
Class {
	#name : #ISUPGRS,
	#superclass : #ISUPMessage,
	#category : #ISUP
}

{ #category : #field }
ISUPGRS class >> tlvDescription [
	^(self initWith: ISUPConstants msgGRS)
	    addVariable: ISUPRange;
	    yourself

]

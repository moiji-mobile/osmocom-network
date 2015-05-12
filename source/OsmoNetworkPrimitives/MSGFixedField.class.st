"
I represent a fixed length field.
"
Class {
	#name : #MSGFixedField,
	#superclass : #MSGField,
	#category : #'OsmoNetworkPrimitives-MSG'
}

{ #category : #kind }
MSGFixedField class >> isFixed [
	^true

]

{ #category : #kind }
MSGFixedField class >> isVarible [
	^false

]

{ #category : #parsing }
MSGFixedField class >> readFixedFrom: aStream [
	^(self new)
	    data: (aStream next: self octalLength);
	    yourself

]

{ #category : #parsing }
MSGFixedField class >> readVariableFrom: aStream length: aLength [
	aLength = self octalLength 
	    ifFalse: [^self error: 'The size needs to be exact'].
	^super readVariableFrom: aStream length: aLength

]

"
The description of an Information Element
"
Class {
	#name : #MSGField,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'OsmoNetwork-MSG'
}

{ #category : #parsing }
MSGField class >> isCompatible: aField [
	^aField isKindOf: self

]

{ #category : #kind }
MSGField class >> isFixed [
	"If this field is of a fixed length"
	^self subclassResponsibility

]

{ #category : #kind }
MSGField class >> isVarible [
	"If this field is variable in length"
	^self subclassResponsibility

]

{ #category : #accessing }
MSGField class >> lengthLength [
	"The length of the length field. The default is to assume a length of
	 one octet and in the units of octets"
	^1

]

{ #category : #accessing }
MSGField class >> maxLength [
	^nil

]

{ #category : #accessing }
MSGField class >> octalLength [
	^self subclassResponsibility

]

{ #category : #accessing }
MSGField class >> parameterName [
	^self subclassResponsibility

]

{ #category : #accessing }
MSGField class >> parameterValue [
	^self subclassResponsibility

]

{ #category : #parsing }
MSGField class >> readVariableFrom: aStream length: aLength [
	"I verify that I am allowed to read that much and then will read it"
	aLength < self octalLength 
	    ifTrue: 
		[^self 
		    error: ('The data is too short. <1p> < <2p>' expandMacrosWith: aLength
			    with: self octalLength)].
	self maxLength ifNotNil: 
		[aLength > self maxLength 
		    ifTrue: 
			[^self 
			    error: ('The data is too long <1p> > <2p>.' expandMacrosWith: aLength
				    with: self maxLength)]].
	^(self new)
	    data: (aStream next: aLength);
	    yourself

]

{ #category : #accessing }
MSGField >> data [
	^data

]

{ #category : #accessing }
MSGField >> data: aData [
	data := aData

]

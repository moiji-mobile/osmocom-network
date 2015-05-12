"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCallReference,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallReference class >> octalLength [
	^5

]

{ #category : #field }
ISUPCallReference class >> parameterName [
	^'Call reference'

]

{ #category : #field }
ISUPCallReference class >> parameterValue [
	^ISUPConstants parCallReference

]

{ #category : #field }
ISUPCallReference class >> spec [
	^'3.8'

]

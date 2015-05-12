"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPEndOfOptionalParameters,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPEndOfOptionalParameters class >> lengthLength [
	^0

]

{ #category : #field }
ISUPEndOfOptionalParameters class >> octalLength [
	^0

]

{ #category : #field }
ISUPEndOfOptionalParameters class >> parameterName [
	^'End of optional parameters'

]

{ #category : #field }
ISUPEndOfOptionalParameters class >> parameterValue [
	^ISUPConstants parEndOfOptionalParameters

]

{ #category : #field }
ISUPEndOfOptionalParameters class >> spec [
	^'3.20'

]

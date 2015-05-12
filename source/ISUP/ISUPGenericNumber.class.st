"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPGenericNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPGenericNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPGenericNumber class >> octalLength [
	^3

]

{ #category : #field }
ISUPGenericNumber class >> parameterName [
	^'Generic number'

]

{ #category : #field }
ISUPGenericNumber class >> parameterValue [
	^ISUPConstants parGenericNumber

]

{ #category : #field }
ISUPGenericNumber class >> spec [
	^'3.26'

]

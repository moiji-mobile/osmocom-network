"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPLocationNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPLocationNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPLocationNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPLocationNumber class >> parameterName [
	^'Location number'

]

{ #category : #field }
ISUPLocationNumber class >> parameterValue [
	^ISUPConstants parLocationNumber

]

{ #category : #field }
ISUPLocationNumber class >> spec [
	^'3.30'

]

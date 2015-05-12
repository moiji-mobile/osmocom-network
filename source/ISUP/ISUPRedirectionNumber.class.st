"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRedirectionNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectionNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPRedirectionNumber class >> octalLength [
	^3

]

{ #category : #field }
ISUPRedirectionNumber class >> parameterName [
	^'Redirection number'

]

{ #category : #field }
ISUPRedirectionNumber class >> parameterValue [
	^ISUPConstants parRedirectionNumber

]

{ #category : #field }
ISUPRedirectionNumber class >> spec [
	^'3.46'

]

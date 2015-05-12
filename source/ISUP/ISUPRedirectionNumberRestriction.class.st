"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPRedirectionNumberRestriction,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectionNumberRestriction class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectionNumberRestriction class >> parameterName [
	^'Redirection number restriction'

]

{ #category : #field }
ISUPRedirectionNumberRestriction class >> parameterValue [
	^ISUPConstants parRedirectionNumberRestriction

]

{ #category : #field }
ISUPRedirectionNumberRestriction class >> spec [
	^'3.47'

]

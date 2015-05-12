"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRedirectingNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectingNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPRedirectingNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPRedirectingNumber class >> parameterName [
	^'Redirecting number'

]

{ #category : #field }
ISUPRedirectingNumber class >> parameterValue [
	^ISUPConstants parRedirectingNumber

]

{ #category : #field }
ISUPRedirectingNumber class >> spec [
	^'3.44'

]

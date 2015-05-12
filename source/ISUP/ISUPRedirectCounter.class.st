"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPRedirectCounter,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectCounter class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectCounter class >> parameterName [
	^'Redirect counter'

]

{ #category : #field }
ISUPRedirectCounter class >> parameterValue [
	^ISUPConstants parRedirectCounter

]

{ #category : #field }
ISUPRedirectCounter class >> spec [
	^'3.97'

]

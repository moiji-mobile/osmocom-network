"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPForwardCallIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPForwardCallIndicators class >> octalLength [
	^2

]

{ #category : #field }
ISUPForwardCallIndicators class >> parameterName [
	^'Forward call indicators'

]

{ #category : #field }
ISUPForwardCallIndicators class >> parameterValue [
	^ISUPConstants parForwardCallIndicators

]

{ #category : #field }
ISUPForwardCallIndicators class >> spec [
	^'3.23'

]

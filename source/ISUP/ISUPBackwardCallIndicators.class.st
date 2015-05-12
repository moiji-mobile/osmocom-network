"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPBackwardCallIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPBackwardCallIndicators class >> octalLength [
	^2

]

{ #category : #field }
ISUPBackwardCallIndicators class >> parameterName [
	^'Backward call indicators'

]

{ #category : #field }
ISUPBackwardCallIndicators class >> parameterValue [
	^ISUPConstants parBackwardCallIndicators

]

{ #category : #field }
ISUPBackwardCallIndicators class >> spec [
	^'3.5'

]

"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPOptionalBackwardCallIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPOptionalBackwardCallIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPOptionalBackwardCallIndicators class >> parameterName [
	^'Optional backward call indicators'

]

{ #category : #field }
ISUPOptionalBackwardCallIndicators class >> parameterValue [
	^ISUPConstants parOptionalBackwardCallIndicators

]

{ #category : #field }
ISUPOptionalBackwardCallIndicators class >> spec [
	^'3.37'

]

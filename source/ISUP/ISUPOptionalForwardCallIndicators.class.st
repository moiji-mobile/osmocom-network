"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPOptionalForwardCallIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPOptionalForwardCallIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPOptionalForwardCallIndicators class >> parameterName [
	^'Optional forward call indicators'

]

{ #category : #field }
ISUPOptionalForwardCallIndicators class >> parameterValue [
	^ISUPConstants parOptionalForwardCallIndicators

]

{ #category : #field }
ISUPOptionalForwardCallIndicators class >> spec [
	^'3.38'

]

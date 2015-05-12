"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPInformationIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPInformationIndicators class >> octalLength [
	^2

]

{ #category : #field }
ISUPInformationIndicators class >> parameterName [
	^'Information indicators'

]

{ #category : #field }
ISUPInformationIndicators class >> parameterValue [
	^ISUPConstants parInformationIndicators

]

{ #category : #field }
ISUPInformationIndicators class >> spec [
	^'3.28'

]

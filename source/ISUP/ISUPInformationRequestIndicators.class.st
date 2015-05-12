"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPInformationRequestIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPInformationRequestIndicators class >> octalLength [
	^2

]

{ #category : #field }
ISUPInformationRequestIndicators class >> parameterName [
	^'Information request indicators'

]

{ #category : #field }
ISUPInformationRequestIndicators class >> parameterValue [
	^ISUPConstants parInformationRequestIndicators

]

{ #category : #field }
ISUPInformationRequestIndicators class >> spec [
	^'3.29'

]

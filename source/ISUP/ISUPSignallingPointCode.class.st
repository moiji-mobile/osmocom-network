"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPSignallingPointCode,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPSignallingPointCode class >> octalLength [
	^2

]

{ #category : #field }
ISUPSignallingPointCode class >> parameterName [
	^'Signalling point code'

]

{ #category : #field }
ISUPSignallingPointCode class >> parameterValue [
	^ISUPConstants parSignallingPointCode

]

{ #category : #field }
ISUPSignallingPointCode class >> spec [
	^'3.50'

]

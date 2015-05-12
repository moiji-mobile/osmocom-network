"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPOriginalCalledNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPOriginalCalledNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPOriginalCalledNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPOriginalCalledNumber class >> parameterName [
	^'Original called number'

]

{ #category : #field }
ISUPOriginalCalledNumber class >> parameterValue [
	^ISUPConstants parOriginalCalledNumber

]

{ #category : #field }
ISUPOriginalCalledNumber class >> spec [
	^'3.39'

]

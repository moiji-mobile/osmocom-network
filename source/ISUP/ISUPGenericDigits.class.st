"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPGenericDigits,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPGenericDigits class >> maxLength [
	^nil

]

{ #category : #field }
ISUPGenericDigits class >> octalLength [
	^2

]

{ #category : #field }
ISUPGenericDigits class >> parameterName [
	^'Generic digits'

]

{ #category : #field }
ISUPGenericDigits class >> parameterValue [
	^ISUPConstants parGenericDigits

]

{ #category : #field }
ISUPGenericDigits class >> spec [
	^'3.24'

]

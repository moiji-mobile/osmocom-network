"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPHTRInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPHTRInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPHTRInformation class >> octalLength [
	^2

]

{ #category : #field }
ISUPHTRInformation class >> parameterName [
	^'HTR information'

]

{ #category : #field }
ISUPHTRInformation class >> parameterValue [
	^ISUPConstants parHTRInformation

]

{ #category : #field }
ISUPHTRInformation class >> spec [
	^'3.89'

]

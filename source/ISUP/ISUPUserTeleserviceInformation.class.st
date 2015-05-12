"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPUserTeleserviceInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPUserTeleserviceInformation class >> maxLength [
	^3

]

{ #category : #field }
ISUPUserTeleserviceInformation class >> octalLength [
	^2

]

{ #category : #field }
ISUPUserTeleserviceInformation class >> parameterName [
	^'User teleservice information'

]

{ #category : #field }
ISUPUserTeleserviceInformation class >> parameterValue [
	^ISUPConstants parUserTeleserviceInformation

]

{ #category : #field }
ISUPUserTeleserviceInformation class >> spec [
	^'3.59'

]

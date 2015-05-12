"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPUserServiceInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPUserServiceInformation class >> maxLength [
	^11

]

{ #category : #field }
ISUPUserServiceInformation class >> octalLength [
	^2

]

{ #category : #field }
ISUPUserServiceInformation class >> parameterName [
	^'User service information'

]

{ #category : #field }
ISUPUserServiceInformation class >> parameterValue [
	^ISUPConstants parUserServiceInformation

]

{ #category : #field }
ISUPUserServiceInformation class >> spec [
	^'3.57'

]

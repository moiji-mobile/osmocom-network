"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRedirectionInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectionInformation class >> maxLength [
	^2

]

{ #category : #field }
ISUPRedirectionInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectionInformation class >> parameterName [
	^'Redirection information'

]

{ #category : #field }
ISUPRedirectionInformation class >> parameterValue [
	^ISUPConstants parRedirectionInformation

]

{ #category : #field }
ISUPRedirectionInformation class >> spec [
	^'3.45'

]

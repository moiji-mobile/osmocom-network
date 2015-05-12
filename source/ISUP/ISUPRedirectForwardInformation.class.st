"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRedirectForwardInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectForwardInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPRedirectForwardInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectForwardInformation class >> parameterName [
	^'Redirect forward information'

]

{ #category : #field }
ISUPRedirectForwardInformation class >> parameterValue [
	^ISUPConstants parRedirectForwardInformation

]

{ #category : #field }
ISUPRedirectForwardInformation class >> spec [
	^'3.99'

]

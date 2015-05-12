"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRedirectBackwardInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectBackwardInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPRedirectBackwardInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectBackwardInformation class >> parameterName [
	^'Redirect backward information'

]

{ #category : #field }
ISUPRedirectBackwardInformation class >> parameterValue [
	^ISUPConstants parRedirectBackwardInformation

]

{ #category : #field }
ISUPRedirectBackwardInformation class >> spec [
	^'3.100'

]

"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPParameterCompatibilityInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPParameterCompatibilityInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPParameterCompatibilityInformation class >> octalLength [
	^2

]

{ #category : #field }
ISUPParameterCompatibilityInformation class >> parameterName [
	^'Parameter compatibility information'

]

{ #category : #field }
ISUPParameterCompatibilityInformation class >> parameterValue [
	^ISUPConstants parParameterCompatibilityInformation

]

{ #category : #field }
ISUPParameterCompatibilityInformation class >> spec [
	^'3.41'

]

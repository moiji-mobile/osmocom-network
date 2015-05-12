"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPMessageCompatibilityInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPMessageCompatibilityInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPMessageCompatibilityInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPMessageCompatibilityInformation class >> parameterName [
	^'Message compatibility information'

]

{ #category : #field }
ISUPMessageCompatibilityInformation class >> parameterValue [
	^ISUPConstants parMessageCompatibilityInformation

]

{ #category : #field }
ISUPMessageCompatibilityInformation class >> spec [
	^'3.33'

]

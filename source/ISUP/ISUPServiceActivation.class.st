"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPServiceActivation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPServiceActivation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPServiceActivation class >> octalLength [
	^1

]

{ #category : #field }
ISUPServiceActivation class >> parameterName [
	^'Service activation'

]

{ #category : #field }
ISUPServiceActivation class >> parameterValue [
	^ISUPConstants parServiceActivation

]

{ #category : #field }
ISUPServiceActivation class >> spec [
	^'3.49'

]

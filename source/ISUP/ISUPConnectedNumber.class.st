"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPConnectedNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPConnectedNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPConnectedNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPConnectedNumber class >> parameterName [
	^'Connected number'

]

{ #category : #field }
ISUPConnectedNumber class >> parameterValue [
	^ISUPConstants parConnectedNumber

]

{ #category : #field }
ISUPConnectedNumber class >> spec [
	^'3.16'

]

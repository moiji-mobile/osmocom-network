"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCauseIndicators,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCauseIndicators class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCauseIndicators class >> octalLength [
	^2

]

{ #category : #field }
ISUPCauseIndicators class >> parameterName [
	^'Cause indicators'

]

{ #category : #field }
ISUPCauseIndicators class >> parameterValue [
	^ISUPConstants parCauseIndicators

]

{ #category : #field }
ISUPCauseIndicators class >> spec [
	^'3.12'

]

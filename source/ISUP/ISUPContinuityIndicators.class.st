"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPContinuityIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPContinuityIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPContinuityIndicators class >> parameterName [
	^'Continuity indicators'

]

{ #category : #field }
ISUPContinuityIndicators class >> parameterValue [
	^ISUPConstants parContinuityIndicators

]

{ #category : #field }
ISUPContinuityIndicators class >> spec [
	^'3.18'

]

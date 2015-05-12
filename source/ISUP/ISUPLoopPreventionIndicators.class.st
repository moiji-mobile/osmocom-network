"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPLoopPreventionIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPLoopPreventionIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPLoopPreventionIndicators class >> parameterName [
	^'Loop prevention indicators'

]

{ #category : #field }
ISUPLoopPreventionIndicators class >> parameterValue [
	^ISUPConstants parLoopPreventionIndicators

]

{ #category : #field }
ISUPLoopPreventionIndicators class >> spec [
	^'3.67'

]

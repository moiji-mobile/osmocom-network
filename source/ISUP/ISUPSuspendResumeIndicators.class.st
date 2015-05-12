"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPSuspendResumeIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPSuspendResumeIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPSuspendResumeIndicators class >> parameterName [
	^'Suspend/resume indicators'

]

{ #category : #field }
ISUPSuspendResumeIndicators class >> parameterValue [
	^ISUPConstants parSuspendResumeIndicators

]

{ #category : #field }
ISUPSuspendResumeIndicators class >> spec [
	^'3.52'

]

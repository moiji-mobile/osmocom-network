"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCorrelationId,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCorrelationId class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCorrelationId class >> octalLength [
	^1

]

{ #category : #field }
ISUPCorrelationId class >> parameterName [
	^'Correlation id'

]

{ #category : #field }
ISUPCorrelationId class >> parameterValue [
	^ISUPConstants parCorrelationId

]

{ #category : #field }
ISUPCorrelationId class >> spec [
	^'3.70'

]

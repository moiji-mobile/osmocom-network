"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCircuitGroupSupervisionMessageType,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCircuitGroupSupervisionMessageType class >> octalLength [
	^1

]

{ #category : #field }
ISUPCircuitGroupSupervisionMessageType class >> parameterName [
	^'Circuit group supervision message type'

]

{ #category : #field }
ISUPCircuitGroupSupervisionMessageType class >> parameterValue [
	^ISUPConstants parCircuitGroupSupervisionMessageType

]

{ #category : #field }
ISUPCircuitGroupSupervisionMessageType class >> spec [
	^'3.13'

]

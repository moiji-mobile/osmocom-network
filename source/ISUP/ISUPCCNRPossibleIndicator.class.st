"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCCNRPossibleIndicator,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCCNRPossibleIndicator class >> octalLength [
	^1

]

{ #category : #field }
ISUPCCNRPossibleIndicator class >> parameterName [
	^'CCNR possible indicator'

]

{ #category : #field }
ISUPCCNRPossibleIndicator class >> parameterValue [
	^ISUPConstants parCCNRPossibleIndicator

]

{ #category : #field }
ISUPCCNRPossibleIndicator class >> spec [
	^'3.83'

]

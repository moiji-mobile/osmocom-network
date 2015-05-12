"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPPivotStatus,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPPivotStatus class >> octalLength [
	^1

]

{ #category : #field }
ISUPPivotStatus class >> parameterName [
	^'Pivot status'

]

{ #category : #field }
ISUPPivotStatus class >> parameterValue [
	^ISUPConstants parPivotStatus

]

{ #category : #field }
ISUPPivotStatus class >> spec [
	^'3.92'

]

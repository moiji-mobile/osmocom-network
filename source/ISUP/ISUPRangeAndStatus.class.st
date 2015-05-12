"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPRangeAndStatus,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPRangeAndStatus class >> maxLength [
	^33

]

{ #category : #field }
ISUPRangeAndStatus class >> octalLength [
	^2

]

{ #category : #field }
ISUPRangeAndStatus class >> parameterName [
	^'Range and status'

]

{ #category : #field }
ISUPRangeAndStatus class >> parameterValue [
	^ISUPConstants parRangeAndStatus

]

{ #category : #field }
ISUPRangeAndStatus class >> spec [
	^'3.43'

]

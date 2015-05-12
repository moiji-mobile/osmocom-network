"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPEventInformation,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPEventInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPEventInformation class >> parameterName [
	^'Event information'

]

{ #category : #field }
ISUPEventInformation class >> parameterValue [
	^ISUPConstants parEventInformation

]

{ #category : #field }
ISUPEventInformation class >> spec [
	^'3.21'

]

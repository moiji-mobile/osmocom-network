"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPHopCounter,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPHopCounter class >> octalLength [
	^1

]

{ #category : #field }
ISUPHopCounter class >> parameterName [
	^'Hop counter'

]

{ #category : #field }
ISUPHopCounter class >> parameterValue [
	^ISUPConstants parHopCounter

]

{ #category : #field }
ISUPHopCounter class >> spec [
	^'3.80'

]

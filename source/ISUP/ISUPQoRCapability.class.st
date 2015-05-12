"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPQoRCapability,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPQoRCapability class >> octalLength [
	^1

]

{ #category : #field }
ISUPQoRCapability class >> parameterName [
	^'QoR capability'

]

{ #category : #field }
ISUPQoRCapability class >> parameterValue [
	^ISUPConstants parQoRCapability

]

{ #category : #field }
ISUPQoRCapability class >> spec [
	^'3.91'

]

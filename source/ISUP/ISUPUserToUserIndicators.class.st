"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPUserToUserIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPUserToUserIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPUserToUserIndicators class >> parameterName [
	^'User-to-user indicators'

]

{ #category : #field }
ISUPUserToUserIndicators class >> parameterValue [
	^ISUPConstants parUserToUserIndicators

]

{ #category : #field }
ISUPUserToUserIndicators class >> spec [
	^'3.60'

]

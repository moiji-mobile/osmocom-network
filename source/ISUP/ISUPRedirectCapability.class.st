"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPRedirectCapability,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectCapability class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectCapability class >> parameterName [
	^'Redirect capability'

]

{ #category : #field }
ISUPRedirectCapability class >> parameterValue [
	^ISUPConstants parRedirectCapability

]

{ #category : #field }
ISUPRedirectCapability class >> spec [
	^'3.96'

]

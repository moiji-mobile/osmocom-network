"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPRedirectStatus,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPRedirectStatus class >> octalLength [
	^1

]

{ #category : #field }
ISUPRedirectStatus class >> parameterName [
	^'Redirect status'

]

{ #category : #field }
ISUPRedirectStatus class >> parameterValue [
	^ISUPConstants parRedirectStatus

]

{ #category : #field }
ISUPRedirectStatus class >> spec [
	^'3.98'

]

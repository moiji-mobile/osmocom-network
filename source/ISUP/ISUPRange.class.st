"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPRange,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPRange class >> octalLength [
	^1

]

{ #category : #field }
ISUPRange class >> parameterName [
	^'Range'

]

{ #category : #field }
ISUPRange class >> parameterValue [
	^ISUPConstants parRange

]

{ #category : #field }
ISUPRange class >> spec [
	^'3.43b'

]

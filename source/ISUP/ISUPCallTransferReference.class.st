"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCallTransferReference,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallTransferReference class >> octalLength [
	^1

]

{ #category : #field }
ISUPCallTransferReference class >> parameterName [
	^'Call transfer reference'

]

{ #category : #field }
ISUPCallTransferReference class >> parameterValue [
	^ISUPConstants parCallTransferReference

]

{ #category : #field }
ISUPCallTransferReference class >> spec [
	^'3.65'

]

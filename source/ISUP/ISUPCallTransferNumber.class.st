"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCallTransferNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallTransferNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCallTransferNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPCallTransferNumber class >> parameterName [
	^'Call transfer number'

]

{ #category : #field }
ISUPCallTransferNumber class >> parameterValue [
	^ISUPConstants parCallTransferNumber

]

{ #category : #field }
ISUPCallTransferNumber class >> spec [
	^'3.64'

]

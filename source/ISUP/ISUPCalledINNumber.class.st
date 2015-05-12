"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCalledINNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCalledINNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCalledINNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPCalledINNumber class >> parameterName [
	^'Called IN number'

]

{ #category : #field }
ISUPCalledINNumber class >> parameterValue [
	^ISUPConstants parCalledINNumber

]

{ #category : #field }
ISUPCalledINNumber class >> spec [
	^'3.73'

]

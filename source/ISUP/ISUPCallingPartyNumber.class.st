"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCallingPartyNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallingPartyNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCallingPartyNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPCallingPartyNumber class >> parameterName [
	^'Calling party number'

]

{ #category : #field }
ISUPCallingPartyNumber class >> parameterValue [
	^ISUPConstants parCallingPartyNumber

]

{ #category : #field }
ISUPCallingPartyNumber class >> spec [
	^'3.10'

]

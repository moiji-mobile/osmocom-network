"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCalledPartyNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCalledPartyNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCalledPartyNumber class >> octalLength [
	^3

]

{ #category : #field }
ISUPCalledPartyNumber class >> parameterName [
	^'Called party number'

]

{ #category : #field }
ISUPCalledPartyNumber class >> parameterValue [
	^ISUPConstants parCalledPartyNumber

]

{ #category : #field }
ISUPCalledPartyNumber class >> spec [
	^'3.9'

]

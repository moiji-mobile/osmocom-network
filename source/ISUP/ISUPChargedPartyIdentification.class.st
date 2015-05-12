"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPChargedPartyIdentification,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPChargedPartyIdentification class >> maxLength [
	^nil

]

{ #category : #field }
ISUPChargedPartyIdentification class >> octalLength [
	^1

]

{ #category : #field }
ISUPChargedPartyIdentification class >> parameterName [
	^'Charged party identification'

]

{ #category : #field }
ISUPChargedPartyIdentification class >> parameterValue [
	^ISUPConstants parChargedPartyIdentification

]

{ #category : #field }
ISUPChargedPartyIdentification class >> spec [
	^'3.75'

]

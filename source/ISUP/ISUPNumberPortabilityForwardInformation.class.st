"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPNumberPortabilityForwardInformation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPNumberPortabilityForwardInformation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPNumberPortabilityForwardInformation class >> octalLength [
	^-1

]

{ #category : #field }
ISUPNumberPortabilityForwardInformation class >> parameterName [
	^'Number portability forward information'

]

{ #category : #field }
ISUPNumberPortabilityForwardInformation class >> parameterValue [
	^ISUPConstants parNumberPortabilityForwardInformation

]

{ #category : #field }
ISUPNumberPortabilityForwardInformation class >> spec [
	^'3.101'

]

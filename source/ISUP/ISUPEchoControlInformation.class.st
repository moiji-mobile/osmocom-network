"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPEchoControlInformation,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPEchoControlInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPEchoControlInformation class >> parameterName [
	^'Echo control information'

]

{ #category : #field }
ISUPEchoControlInformation class >> parameterValue [
	^ISUPConstants parEchoControlInformation

]

{ #category : #field }
ISUPEchoControlInformation class >> spec [
	^'3.19'

]

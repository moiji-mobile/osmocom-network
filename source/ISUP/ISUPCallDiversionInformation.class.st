"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCallDiversionInformation,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallDiversionInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPCallDiversionInformation class >> parameterName [
	^'Call diversion information'

]

{ #category : #field }
ISUPCallDiversionInformation class >> parameterValue [
	^ISUPConstants parCallDiversionInformation

]

{ #category : #field }
ISUPCallDiversionInformation class >> spec [
	^'3.6'

]

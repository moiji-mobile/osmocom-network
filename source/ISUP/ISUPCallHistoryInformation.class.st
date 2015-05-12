"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCallHistoryInformation,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallHistoryInformation class >> octalLength [
	^2

]

{ #category : #field }
ISUPCallHistoryInformation class >> parameterName [
	^'Call history information'

]

{ #category : #field }
ISUPCallHistoryInformation class >> parameterValue [
	^ISUPConstants parCallHistoryInformation

]

{ #category : #field }
ISUPCallHistoryInformation class >> spec [
	^'3.7'

]

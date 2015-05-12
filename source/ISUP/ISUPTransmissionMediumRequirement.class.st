"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPTransmissionMediumRequirement,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPTransmissionMediumRequirement class >> octalLength [
	^1

]

{ #category : #field }
ISUPTransmissionMediumRequirement class >> parameterName [
	^'Transmission medium requirement'

]

{ #category : #field }
ISUPTransmissionMediumRequirement class >> parameterValue [
	^ISUPConstants parTransmissionMediumRequirement

]

{ #category : #field }
ISUPTransmissionMediumRequirement class >> spec [
	^'3.54'

]

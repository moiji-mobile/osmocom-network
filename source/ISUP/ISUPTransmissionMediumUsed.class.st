"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPTransmissionMediumUsed,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPTransmissionMediumUsed class >> octalLength [
	^1

]

{ #category : #field }
ISUPTransmissionMediumUsed class >> parameterName [
	^'Transmission medium used'

]

{ #category : #field }
ISUPTransmissionMediumUsed class >> parameterValue [
	^ISUPConstants parTransmissionMediumUsed

]

{ #category : #field }
ISUPTransmissionMediumUsed class >> spec [
	^'3.56'

]

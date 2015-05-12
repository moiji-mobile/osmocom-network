"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPAccessDeliveryInformation,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPAccessDeliveryInformation class >> octalLength [
	^1

]

{ #category : #field }
ISUPAccessDeliveryInformation class >> parameterName [
	^'Access delivery information'

]

{ #category : #field }
ISUPAccessDeliveryInformation class >> parameterValue [
	^ISUPConstants parAccessDeliveryInformation

]

{ #category : #field }
ISUPAccessDeliveryInformation class >> spec [
	^'3.2'

]

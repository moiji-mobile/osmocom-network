"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCollectCallRequest,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPCollectCallRequest class >> octalLength [
	^1

]

{ #category : #field }
ISUPCollectCallRequest class >> parameterName [
	^'Collect call request'

]

{ #category : #field }
ISUPCollectCallRequest class >> parameterValue [
	^ISUPConstants parCollectCallRequest

]

{ #category : #field }
ISUPCollectCallRequest class >> spec [
	^'3.81'

]

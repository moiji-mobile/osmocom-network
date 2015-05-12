"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPOriginationISCPointCode,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPOriginationISCPointCode class >> octalLength [
	^2

]

{ #category : #field }
ISUPOriginationISCPointCode class >> parameterName [
	^'Origination ISC point code'

]

{ #category : #field }
ISUPOriginationISCPointCode class >> parameterValue [
	^ISUPConstants parOriginationISCPointCode

]

{ #category : #field }
ISUPOriginationISCPointCode class >> spec [
	^'3.40'

]

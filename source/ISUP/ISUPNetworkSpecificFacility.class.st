"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPNetworkSpecificFacility,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPNetworkSpecificFacility class >> maxLength [
	^nil

]

{ #category : #field }
ISUPNetworkSpecificFacility class >> octalLength [
	^2

]

{ #category : #field }
ISUPNetworkSpecificFacility class >> parameterName [
	^'Network specific facility'

]

{ #category : #field }
ISUPNetworkSpecificFacility class >> parameterValue [
	^ISUPConstants parNetworkSpecificFacility

]

{ #category : #field }
ISUPNetworkSpecificFacility class >> spec [
	^'3.36'

]

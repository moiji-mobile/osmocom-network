"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPApplicationTransportParameter,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPApplicationTransportParameter class >> maxLength [
	^nil

]

{ #category : #field }
ISUPApplicationTransportParameter class >> octalLength [
	^3

]

{ #category : #field }
ISUPApplicationTransportParameter class >> parameterName [
	^'Application transport parameter'

]

{ #category : #field }
ISUPApplicationTransportParameter class >> parameterValue [
	^ISUPConstants parApplicationTransportParameter

]

{ #category : #field }
ISUPApplicationTransportParameter class >> spec [
	^'3.82'

]

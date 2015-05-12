"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPAccessTransport,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPAccessTransport class >> maxLength [
	^nil

]

{ #category : #field }
ISUPAccessTransport class >> octalLength [
	^1

]

{ #category : #field }
ISUPAccessTransport class >> parameterName [
	^'Access transport'

]

{ #category : #field }
ISUPAccessTransport class >> parameterValue [
	^ISUPConstants parAccessTransport

]

{ #category : #field }
ISUPAccessTransport class >> spec [
	^'3.3'

]

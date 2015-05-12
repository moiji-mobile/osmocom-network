"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPConnectionRequest,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPConnectionRequest class >> maxLength [
	^7

]

{ #category : #field }
ISUPConnectionRequest class >> octalLength [
	^5

]

{ #category : #field }
ISUPConnectionRequest class >> parameterName [
	^'Connection request'

]

{ #category : #field }
ISUPConnectionRequest class >> parameterValue [
	^ISUPConstants parConnectionRequest

]

{ #category : #field }
ISUPConnectionRequest class >> spec [
	^'3.17'

]

"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPSCFId,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPSCFId class >> maxLength [
	^nil

]

{ #category : #field }
ISUPSCFId class >> octalLength [
	^1

]

{ #category : #field }
ISUPSCFId class >> parameterName [
	^'SCF id'

]

{ #category : #field }
ISUPSCFId class >> parameterValue [
	^ISUPConstants parSCFId

]

{ #category : #field }
ISUPSCFId class >> spec [
	^'3.71'

]

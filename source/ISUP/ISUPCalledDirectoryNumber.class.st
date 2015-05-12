"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCalledDirectoryNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCalledDirectoryNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCalledDirectoryNumber class >> octalLength [
	^3

]

{ #category : #field }
ISUPCalledDirectoryNumber class >> parameterName [
	^'Called directory number'

]

{ #category : #field }
ISUPCalledDirectoryNumber class >> parameterValue [
	^ISUPConstants parCalledDirectoryNumber

]

{ #category : #field }
ISUPCalledDirectoryNumber class >> spec [
	^'3.86'

]

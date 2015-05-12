"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCallingGeodeticLocation,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCallingGeodeticLocation class >> maxLength [
	^nil

]

{ #category : #field }
ISUPCallingGeodeticLocation class >> octalLength [
	^1

]

{ #category : #field }
ISUPCallingGeodeticLocation class >> parameterName [
	^'Calling geodetic location'

]

{ #category : #field }
ISUPCallingGeodeticLocation class >> parameterValue [
	^ISUPConstants parCallingGeodeticLocation

]

{ #category : #field }
ISUPCallingGeodeticLocation class >> spec [
	^'3.88'

]

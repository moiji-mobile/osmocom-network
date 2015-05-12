"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPTransitNetworkSelection,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPTransitNetworkSelection class >> maxLength [
	^nil

]

{ #category : #field }
ISUPTransitNetworkSelection class >> octalLength [
	^2

]

{ #category : #field }
ISUPTransitNetworkSelection class >> parameterName [
	^'Transit network selection'

]

{ #category : #field }
ISUPTransitNetworkSelection class >> parameterValue [
	^ISUPConstants parTransitNetworkSelection

]

{ #category : #field }
ISUPTransitNetworkSelection class >> spec [
	^'3.53'

]

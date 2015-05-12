"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPNetworkRoutingNumber,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPNetworkRoutingNumber class >> maxLength [
	^nil

]

{ #category : #field }
ISUPNetworkRoutingNumber class >> octalLength [
	^2

]

{ #category : #field }
ISUPNetworkRoutingNumber class >> parameterName [
	^'Network routing number'

]

{ #category : #field }
ISUPNetworkRoutingNumber class >> parameterValue [
	^ISUPConstants parNetworkRoutingNumber

]

{ #category : #field }
ISUPNetworkRoutingNumber class >> spec [
	^'3.90'

]

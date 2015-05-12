"
I represent a variable sized field.
"
Class {
	#name : #MSGVariableField,
	#superclass : #MSGField,
	#category : #'OsmoNetworkPrimitives-MSG'
}

{ #category : #kind }
MSGVariableField class >> isFixed [
	^false

]

{ #category : #kind }
MSGVariableField class >> isVarible [
	^true

]

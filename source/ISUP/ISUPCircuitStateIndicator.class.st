"
I am an auto generated ISUP variable.
"
Class {
	#name : #ISUPCircuitStateIndicator,
	#superclass : #MSGVariableField,
	#category : #ISUP
}

{ #category : #field }
ISUPCircuitStateIndicator class >> maxLength [
	^32

]

{ #category : #field }
ISUPCircuitStateIndicator class >> octalLength [
	^1

]

{ #category : #field }
ISUPCircuitStateIndicator class >> parameterName [
	^'Circuit state indicator'

]

{ #category : #field }
ISUPCircuitStateIndicator class >> parameterValue [
	^ISUPConstants parCircuitStateIndicator

]

{ #category : #field }
ISUPCircuitStateIndicator class >> spec [
	^'3.14'

]

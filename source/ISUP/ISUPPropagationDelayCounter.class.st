"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPPropagationDelayCounter,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPPropagationDelayCounter class >> octalLength [
	^2

]

{ #category : #field }
ISUPPropagationDelayCounter class >> parameterName [
	^'Propagation delay counter'

]

{ #category : #field }
ISUPPropagationDelayCounter class >> parameterValue [
	^ISUPConstants parPropagationDelayCounter

]

{ #category : #field }
ISUPPropagationDelayCounter class >> spec [
	^'3.42'

]

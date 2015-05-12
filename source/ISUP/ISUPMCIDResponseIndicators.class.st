"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPMCIDResponseIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPMCIDResponseIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPMCIDResponseIndicators class >> parameterName [
	^'MCID response indicators'

]

{ #category : #field }
ISUPMCIDResponseIndicators class >> parameterValue [
	^ISUPConstants parMCIDResponseIndicators

]

{ #category : #field }
ISUPMCIDResponseIndicators class >> spec [
	^'3.32'

]

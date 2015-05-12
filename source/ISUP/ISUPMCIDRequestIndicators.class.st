"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPMCIDRequestIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPMCIDRequestIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPMCIDRequestIndicators class >> parameterName [
	^'MCID request indicators'

]

{ #category : #field }
ISUPMCIDRequestIndicators class >> parameterValue [
	^ISUPConstants parMCIDRequestIndicators

]

{ #category : #field }
ISUPMCIDRequestIndicators class >> spec [
	^'3.31'

]

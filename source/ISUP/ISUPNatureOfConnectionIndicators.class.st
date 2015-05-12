"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPNatureOfConnectionIndicators,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> cciNotRequired [
	^2r00

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> cciPerformed [
	^2r10

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> cciRequired [
	^2r01

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> cciSpare [
	^2r11

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> ecdiIncluded [
	^2r1

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> ecdiNotIncluded [
	^2r0

]

{ #category : #field }
ISUPNatureOfConnectionIndicators class >> octalLength [
	^1

]

{ #category : #field }
ISUPNatureOfConnectionIndicators class >> parameterName [
	^'Nature of connection indicators'

]

{ #category : #field }
ISUPNatureOfConnectionIndicators class >> parameterValue [
	^ISUPConstants parNatureOfConnectionIndicators

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> satNoSat [
	^2r00

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> satOneSat [
	^2r01

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> satSpare [
	^2r11

]

{ #category : #'isup-extension' }
ISUPNatureOfConnectionIndicators class >> satTwoSat [
	^2r10

]

{ #category : #field }
ISUPNatureOfConnectionIndicators class >> spec [
	^'3.35'

]

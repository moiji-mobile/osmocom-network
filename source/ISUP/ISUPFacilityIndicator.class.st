"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPFacilityIndicator,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPFacilityIndicator class >> octalLength [
	^1

]

{ #category : #field }
ISUPFacilityIndicator class >> parameterName [
	^'Facility indicator'

]

{ #category : #field }
ISUPFacilityIndicator class >> parameterValue [
	^ISUPConstants parFacilityIndicator

]

{ #category : #field }
ISUPFacilityIndicator class >> spec [
	^'3.22'

]

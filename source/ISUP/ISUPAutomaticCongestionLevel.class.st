"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPAutomaticCongestionLevel,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPAutomaticCongestionLevel class >> octalLength [
	^1

]

{ #category : #field }
ISUPAutomaticCongestionLevel class >> parameterName [
	^'Automatic congestion level'

]

{ #category : #field }
ISUPAutomaticCongestionLevel class >> parameterValue [
	^ISUPConstants parAutomaticCongestionLevel

]

{ #category : #field }
ISUPAutomaticCongestionLevel class >> spec [
	^'3.4'

]

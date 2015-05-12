"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPGenericNotificationIndicator,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPGenericNotificationIndicator class >> octalLength [
	^1

]

{ #category : #field }
ISUPGenericNotificationIndicator class >> parameterName [
	^'Generic notification indicator'

]

{ #category : #field }
ISUPGenericNotificationIndicator class >> parameterValue [
	^ISUPConstants parGenericNotificationIndicator

]

{ #category : #field }
ISUPGenericNotificationIndicator class >> spec [
	^'3.25'

]

"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPClosedUserGroupInterlockCode,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPClosedUserGroupInterlockCode class >> octalLength [
	^4

]

{ #category : #field }
ISUPClosedUserGroupInterlockCode class >> parameterName [
	^'Closed user group interlock code'

]

{ #category : #field }
ISUPClosedUserGroupInterlockCode class >> parameterValue [
	^ISUPConstants parClosedUserGroupInterlockCode

]

{ #category : #field }
ISUPClosedUserGroupInterlockCode class >> spec [
	^'3.15'

]

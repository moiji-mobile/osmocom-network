"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPMLPPPrecedence,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #field }
ISUPMLPPPrecedence class >> octalLength [
	^6

]

{ #category : #field }
ISUPMLPPPrecedence class >> parameterName [
	^'MLPP precedence'

]

{ #category : #field }
ISUPMLPPPrecedence class >> parameterValue [
	^ISUPConstants parMLPPPrecedence

]

{ #category : #field }
ISUPMLPPPrecedence class >> spec [
	^'3.34'

]

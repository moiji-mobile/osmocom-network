"
I am an auto generated ISUP fixed field.
"
Class {
	#name : #ISUPCallingPartysCategory,
	#superclass : #MSGFixedField,
	#category : #ISUP
}

{ #category : #encoding }
ISUPCallingPartysCategory class >> callingSubscriberWithPriority [
	^2r1011
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> categoryUnknown [
	^2r0
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> dataCall [
	^2r1100
]

{ #category : #field }
ISUPCallingPartysCategory class >> octalLength [
	^1

]

{ #category : #encoding }
ISUPCallingPartysCategory class >> operatorLanguageEnglish [
	^2r10
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> operatorLanguageFrench [
	^2r1
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> operatorLanguageGerman [
	^2r11
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> operatorLanguageRussian [
	^2r100
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> operatorLanguageSpanish [
	^2r101
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> ordinarySubscriber [
	^2r1010
]

{ #category : #field }
ISUPCallingPartysCategory class >> parameterName [
	^'Calling party''s category'

]

{ #category : #field }
ISUPCallingPartysCategory class >> parameterValue [
	^ISUPConstants parCallingPartysCategory

]

{ #category : #encoding }
ISUPCallingPartysCategory class >> payphone [
	^2r1111
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> reserved [
	^2r1001
]

{ #category : #encoding }
ISUPCallingPartysCategory class >> spare [
	^2r1110
]

{ #category : #field }
ISUPCallingPartysCategory class >> spec [
	^'3.11'

]

{ #category : #encoding }
ISUPCallingPartysCategory class >> testCall [
	^2r1101
]

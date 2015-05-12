Extension { #name : #Object }

{ #category : #'*OsmoNetwork-message' }
Object >> toMessage [
	| msg |
	msg := MessageBuffer new.
	self writeOn: msg.
	^msg

]

{ #category : #'*OsmoNetwork-Message' }
Object >> toMessageOrByteArray [
	^self toMessage

]

Extension { #name : #Object }

{ #category : #'*OsmoNetworkPrimitives-Message' }
Object >> toMessage [
	| msg |
	msg := MessageBuffer new.
	self writeOn: msg.
	^msg

]

{ #category : #'*OsmoNetworkPrimitives-Message' }
Object >> toMessageOrByteArray [
	^self toMessage

]

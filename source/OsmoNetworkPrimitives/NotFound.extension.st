Extension { #name : #NotFound }

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
NotFound class >> signalOn: anObject what: aMessage [
	^(self new)
	    object: anObject;
	    messageText: aMessage;
	    signal

]

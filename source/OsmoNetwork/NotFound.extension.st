Extension { #name : #NotFound }

{ #category : #'*OsmoNetwork-Pharo' }
NotFound class >> signalOn: anObject what: aMessage [
	^(self new)
	    object: anObject;
	    messageText: aMessage;
	    signal

]

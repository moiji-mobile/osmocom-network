"
I am the generic base class for all defined
    SCCP messages. You should only deal with me to decode
    data.
"
Class {
	#name : #SCCPMessage,
	#superclass : #Object,
	#category : #'OsmoNetwork-SCCP'
}

{ #category : #parsing }
SCCPMessage class >> decode: aByteArray [
	| type |
	type := aByteArray at: 1.
	SCCPMessage 
	    allSubclassesDo: [:each | each msgType = type ifTrue: [^each parseFrom: aByteArray]].

	"raise exception"
	^Error signal: ('No handler for: <1p>' expandMacrosWith: type)

]

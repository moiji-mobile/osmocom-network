Class {
	#name : #BERTDecoder,
	#superclass : #Object,
	#category : #'BERT-Codec-Core'
}

{ #category : #'as yet unclassified' }
BERTDecoder class >> decode: aReadStream [ 
	| start |
	start := aReadStream next.
	start = 131
		ifFalse: [^self error: 'Unknown BERT representation: ', start asString].
	^self decodeType: aReadStream.
	
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeAtom: aReadStream [ 
	| len |
	"Avoid the String->Symbol handling. Let the user do it
	in case he really needs a symbol."
	len := self decodeLength16: aReadStream.
	^(aReadStream next: len) asString.
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeByteArray: aReadStream [ 
	| len |
	len := self decodeLength32: aReadStream.
	^aReadStream next: len.
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeDictionary: aValue [
	| dict |
	dict := Dictionary new.
	aValue ifNotNil: [
		aValue do: [:each |
			dict at: each first put: each second]].
	^dict
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeInteger: aReadStream [ 
	| int msb |

	msb := aReadStream next.
	msb > 127 ifTrue: [msb := msb - 256].
	int := msb bitShift: 24.

	1 to: 3  do: [:each |
		int := int + (aReadStream next bitShift: (3 - each) * 8)].
	^int
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeLength16: aReadStream [ 
	| int |
	int := 0 + (aReadStream next bitShift: 8).
	int := int + (aReadStream next bitShift: 0).
	^int
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeLength32: aReadStream [ 
	| int |
	int := 0  + (aReadStream next bitShift: 24).
	int := int + (aReadStream next bitShift: 16).
	int := int + (aReadStream next bitShift: 8).
	int := int + (aReadStream next bitShift: 0).
	^int
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeList: aReadStream [
	| len elements tail |

	"Get the length and pre-allocate with that length. Now this is a network
	input let's hope the low-space signalling will do something sensible here."
	len := self decodeLength32: aReadStream.
	elements := OrderedCollection new: len.
	1 to: len do: [:each |
		elements add: (self decodeType: aReadStream)].
	tail := self decodeType: aReadStream.
	"TODO: Check if it is nil for a proper list?"
	^elements
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeNil: aReadStream [ 
	"Erlang is working with lists. nil is an empty list for them...Return an array"
	^#()
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeSmallInteger: aReadStream [ 
	^aReadStream next asInteger
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeSmallTuple: aReadStream [ 
	| len array |
	len := aReadStream next.
	array := Array new: len.

	1 to: len do: [:each |
		array at: each put: (self decodeType: aReadStream)].

	"Special bart handling"
	array size >= 2 ifTrue: [
		array first = #bert ifTrue: [ 
			array second = #nil ifTrue: [^nil].
			array second = #true ifTrue: [^true].
			array second = #false ifTrue: [^false].
			array second = #dict ifTrue: [^self decodeDictionary: array third]]].

	^array
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeString: aReadStream [ 
	| len |
	len := self decodeLength16: aReadStream.
	^(aReadStream next: len) asString.
]

{ #category : #'as yet unclassified' }
BERTDecoder class >> decodeType: aReadStream [ 
	| tag |
	tag := aReadStream next.

	"Look-up for the poor"
	tag = 97 ifTrue: [^self decodeSmallInteger: aReadStream].
	tag = 98 ifTrue: [^self decodeInteger: aReadStream].
	tag = 100 ifTrue: [^self decodeAtom: aReadStream].
	tag = 109 ifTrue: [^self decodeByteArray: aReadStream].
	tag = 104 ifTrue: [^self decodeSmallTuple: aReadStream].
	tag = 106 ifTrue: [^self decodeNil: aReadStream].
	tag = 107 ifTrue: [^self decodeString: aReadStream].
	tag = 108 ifTrue: [^self decodeList: aReadStream].

	"Unhandled"
	^self error: 'Tag ', tag asString, ' is not decodable'.
]

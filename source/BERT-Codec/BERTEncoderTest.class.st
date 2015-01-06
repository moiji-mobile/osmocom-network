Class {
	#name : #BERTEncoderTest,
	#superclass : #TestCase,
	#category : #'BERT-Codec-Test'
}

{ #category : #'as yet unclassified' }
BERTEncoderTest >> encode: input equals: expectedResult [
	| encoded |
	encoded := BERTEncoder encode: input.
	self assert: encoded equals: expectedResult.
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> expectedFailures [
	^super expectedFailures, #(#testEncodeRegex #testEncodeFloat #testEncodeTime)
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeAtom [
	self encode: #smalltalk equals: #[131 100 0 9 115 109 97 108 108 116 97 108 107].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeBigInteger [
	self encode: 4206488503 equals: #[131 110 4 0 183 235 185 250].
	self encode: 600000000000 equals: #[131 110 5 0 0 112 201 178 139].
	self encode: -600000000000 equals: #[131 110 5 1 0 112 201 178 139].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeBinary [
	self encode: #[1 2 3] equals: #[131 109 0 0 0 3 1 2 3].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeBoolean [
	self encode: true equals: #[131 104 2 100 0 4 98 101 114 116 100 0 4 116 114 117 101].
	self encode: false equals: #[131 104 2 100 0 4 98 101 114 116 100 0 5 102 97 108 115 101].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeByteList [
	self encode: 'abc' equals: #[131 107 0 3 97 98 99].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeDictionary [
	self encode: Dictionary new equals: #[131 104 3 100 0 4 98 101 114 116 100 0 4 100 105 99 116 104 2 100 0 4 98 101 114 116 100 0 3 110 105 108].
	self encode: (Dictionary new at: 'name' put: 'Tom' asByteArray; at: 'age' put: 30; yourself) equals: #[131 104 3 100 0 4 98 101 114 116 100 0 4 100 105 99 116 108 0 0 0 2 104 2 107 0 3 97 103 101 97 30 104 2 107 0 4 110 97 109 101 109 0 0 0 3 84 111 109 106].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeFloat [
	self encode: 3.0 equals: #[131 70 64 8 0 0 0 0 0 0].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeInteger [
	self encode: 1 equals: #[131 97 1].
	self encode: 255 equals: #[131 97 255].
	self encode: -1 equals: #[131 98 255 255 255 255].
	self encode: -110 equals: #[131 98 255 255 255 146].
	self encode: 257 equals: #[131 98 0 0 1 1].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeList [
	self encode: #(#1 #(1 2)) equals: #[131 104 2 97 1 104 2 97 1 97 2].
	self encode: {#a. {1. 2.}} asOrderedCollection equals: #[131 108 0 0 0 2 100 0 1 97 104 2 97 1 97 2 106].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeNil [
	self encode: nil equals: #[131 104 2 100 0 4 98 101 114 116 100 0 3 110 105 108].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeRegex [
	"Not implemented."
	self assert: false.
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeTime [
	| dt |
	dt := DateAndTime year: 2014 month: 7 day: 27 hour: 12 minute: 28 second: 0.
	self encode: dt equals: #[131 104 3 98 0 0 5 126 98 0 6 248 136 97 0].
]

{ #category : #'as yet unclassified' }
BERTEncoderTest >> testEncodeTuple [
	self encode: #(#coord 23 42) equals: #[131 104 3 100 0 5 99 111 111 114 100 97 23 97 42]
]

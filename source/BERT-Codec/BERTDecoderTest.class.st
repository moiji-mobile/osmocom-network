Class {
	#name : #BERTDecoderTest,
	#superclass : #TestCase,
	#category : #'BERT-Codec-Test'
}

{ #category : #'as yet unclassified' }
BERTDecoderTest >> decode: aByteArray equals: aSymbol [
	| decoded |
	decoded := BERTDecoder decode: aByteArray readStream.
	self assert: decoded equals: aSymbol.
	
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> expectedFailures [
	^#(#testDecodeTime #testDecodeRegex #testDecodeBigInteger #testDecodeFloat)
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeAtom [
	"Atoms are decoded as String but Pharo can compare Strings to Symbols"
	self decode: #[131 100 0 9 115 109 97 108 108 116 97 108 107] equals: #smalltalk.
	self decode: #[131 100 0 4 98 101 114 116] equals: #bert.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeBigInteger [
	self decode: #[131 110 5 0 0 112 201 178 139] equals: 600000000000.
	self decode: #[131 110 5 0 0 112 201 178 139] equals: -600000000000.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeBinary [
	self decode: #[131 109 0 0 0 3 1 2 3] equals: #[1 2 3]
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeBoolean [
	self decode: #[131 104 2 100 0 4 98 101 114 116 100 0 4 116 114 117 101] equals: true.
	self decode: #[131 104 2 100 0 4 98 101 114 116 100 0 5 102 97 108 115 101] equals: false.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeByteList [
	self decode: #[131 107 0 3 97 98 99] equals: 'abc'.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeDictionary [
	self decode: #[131 104 3 100 0 4 98 101 114 116 100 0 4 100 105 99 116 104 2 100 0 4 98 101 114 116 100 0 3 110 105 108] equals: Dictionary new.
	self decode: #[131 104 3 100 0 4 98 101 114 116 100 0 4 100 105 99 116 108 0 0 0 2 104 2 100 0 4 110 97 109 101 109 0 0 0 3 84 111 109 104 2 100 0 3 97 103 101 97 30 106] equals: (Dictionary new at: 'name' put: 'Tom' asByteArray; at: 'age' put: 30; yourself)
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeFloat [
	self assert: false
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeInteger [
	self decode: #[131 97 1] equals: 1.
	self decode: #[131 97 255] equals: 255.
	self decode: #[131 98 255 255 255 255] equals: -1.
	self decode: #[131 98 255 255 255 146] equals: -110.
	self decode: #[131 98 0 0 1 1] equals: 257.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeList [
	self decode: #[131 104 4 100 0 4 99 97 108 108 100 0 4 99 97 108 99 100 0 3 97 100 100 108 0 0 0 2 97 1 97 2 106] equals: {#call. #calc. #add. #(1 2) asOrderedCollection}
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeNil [
	self decode: #[131 104 2 100 0 4 98 101 114 116 100 0 3 110 105 108] equals: nil.
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeRegex [
	self assert: false
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeTime [
	self assert: false
]

{ #category : #'as yet unclassified' }
BERTDecoderTest >> testDecodeTuple [
	self decode: #[131 104 3 100 0 5 99 111 111 114 100 97 23 97 42] equals: #(#coord 23 42).
]

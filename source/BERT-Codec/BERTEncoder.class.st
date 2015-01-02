Class {
	#name : #BERTEncoder,
	#superclass : #Object,
	#category : #'BERT-Codec-Core'
}

{ #category : #'as yet unclassified' }
BERTEncoder class >> encode: aValue [
	^ByteArray streamContents: [:stream |
		stream nextPut: 131.
		aValue bertEncodeOn: stream.
	]
]

{ #category : #encoding }
BERTEncoder class >> encodeAtom: aSymbol on: aWriteStream [
	| data |
	"http://erlang.org/doc/apps/erts/erl_ext_dist.html 10.7
	TODO: check length of string convert to latin1"
	
	data := aSymbol asString asByteArray.
	aWriteStream
		nextPut: 100;
		nextPutAll: (self length16: data size);
		nextPutAll: data.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeBigInteger: anInteger on: aWriteStream [ 
	aWriteStream
		nextPut: 98;
		nextPutAll: (self length32: anInteger)
]

{ #category : #encoding }
BERTEncoder class >> encodeByteArray: aByteArray on: aWriteStream [
	"http://erlang.org/doc/apps/erts/erl_ext_dist.html 10.17"
	aWriteStream
		nextPut: 109;
		nextPutAll: (self length32: aByteArray size);
		nextPutAll: aByteArray.

]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeDictionary: aDict on: aWriteStream [ 
	| bertData  assocs |
	self flag: #todo. "Avoid the Array->OrderedCollection transformation but write the tuple directly"
	assocs := aDict isEmpty
					ifTrue: [nil] ifFalse: [aDict associations asOrderedCollection].
	bertData := {#bert. #dict. assocs}.
	bertData bertEncodeOn: aWriteStream.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeFalseOn: aWriteStream [ 
	#(#bert #false) bertEncodeOn: aWriteStream
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeInteger: anInteger on: aWriteStream [ 
	((anInteger > 0) & (anInteger < 256))
		ifTrue: [^self encodeSmallInteger: anInteger on: aWriteStream].
	((anInteger > -2147483648) & (anInteger < 2147483647))
		ifTrue: [^self encodeBigInteger: anInteger on: aWriteStream].
	self error: 'Can''t encode Integer'.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeList: aCollection on: aWriteStream [ 
	aWriteStream
		nextPut: 108;
		nextPutAll: (self length32: aCollection size).
	aCollection do: [:each |
		each bertEncodeOn: aWriteStream].
	aWriteStream nextPut: 106
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeNilOn: aWriteStream [ 
	#(#bert #nil) bertEncodeOn: aWriteStream
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeSmallInteger: anInteger on: aWriteStream [ 
	aWriteStream
		nextPut: 97;
		nextPut: anInteger.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeStringExt: aString on: aWriteStream [ 
	| data |

	data := aString asByteArray.
	
	aWriteStream
		nextPut: 107;
		nextPutAll: (self length16: data size);
		nextPutAll: data.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeTrueOn: aWriteStream [ 
	#(#bert #true) bertEncodeOn: aWriteStream.
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> encodeTuple: aCollection on: aWriteStream [ 
	aCollection size > 255 ifTrue: [^self error: 'This is not implemented yet'].

	aWriteStream
		nextPut: 104;
		nextPut: aCollection size.
	aCollection do: [:each |
		each bertEncodeOn: aWriteStream].
]

{ #category : #encoding }
BERTEncoder class >> length16: anInteger [
	"Same as with MessageBuffer"
	| low high |
	low := (anInteger bitShift: -8) bitAnd: 16rFF.
	high := anInteger bitAnd: 16rFF.
	^ByteArray with: low with: high.
	
]

{ #category : #'as yet unclassified' }
BERTEncoder class >> length32: anInt [
	"I didn't want to use the MessageBuffer here. TODO: make sure the size fits here."
	| a b c d  |
	a := (anInt bitShift: -24) bitAnd: 16rFF.
	b := (anInt bitShift: -16) bitAnd: 16rFF.
	c := (anInt bitShift: -8) bitAnd: 16rFF.
	d := (anInt bitShift: 0) bitAnd: 16rFF.
	^ByteArray 
		    with: a
		    with: b
		    with: c
		    with: d.
]

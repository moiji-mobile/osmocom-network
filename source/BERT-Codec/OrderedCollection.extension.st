Extension { #name : #OrderedCollection }

{ #category : #'*bert-codec-core' }
OrderedCollection >> bertEncodeOn: aWriteStream [
	BERTEncoder encodeList: self on: aWriteStream.
]

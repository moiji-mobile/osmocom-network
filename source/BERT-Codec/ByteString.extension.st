Extension { #name : #ByteString }

{ #category : #'*bert-codec-core' }
ByteString >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeStringExt: self on: aWriteStream.
]

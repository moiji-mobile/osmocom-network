Extension { #name : #ByteArray }

{ #category : #'*bert-codec-core' }
ByteArray >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeByteArray: self on: aWriteStream
]

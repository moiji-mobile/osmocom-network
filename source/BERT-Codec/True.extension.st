Extension { #name : #True }

{ #category : #'*bert-codec-core' }
True >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeTrueOn: aWriteStream
]

Extension { #name : #Association }

{ #category : #'*bert-codec-core' }
Association >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeTuple: (Array with: key with: value) on: aWriteStream
]

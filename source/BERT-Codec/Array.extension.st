Extension { #name : #Array }

{ #category : #'*bert-codec-core' }
Array >> bertEncodeOn: aWriteStream [ 
	^BERTEncoder encodeTuple: self on: aWriteStream.
]

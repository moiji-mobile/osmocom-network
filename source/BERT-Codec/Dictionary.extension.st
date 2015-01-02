Extension { #name : #Dictionary }

{ #category : #'*bert-codec-core' }
Dictionary >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeDictionary: self on: aWriteStream
]

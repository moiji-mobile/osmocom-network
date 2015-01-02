Extension { #name : #Integer }

{ #category : #'*bert-codec-core' }
Integer >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeInteger: self on: aWriteStream
]

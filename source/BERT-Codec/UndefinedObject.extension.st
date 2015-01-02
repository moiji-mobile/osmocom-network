Extension { #name : #UndefinedObject }

{ #category : #'*bert-codec-core' }
UndefinedObject >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeNilOn: aWriteStream
]

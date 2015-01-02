Extension { #name : #Symbol }

{ #category : #'*bert-codec-core' }
Symbol >> bertEncodeOn: aWriteStream [ 
	BERTEncoder encodeAtom: self on: aWriteStream
]

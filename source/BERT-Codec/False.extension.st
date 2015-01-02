Extension { #name : #False }

{ #category : #'*bert-codec-core' }
False >> bertEncodeOn: aWriteStream [ 
	^BERTEncoder encodeFalseOn: aWriteStream.
]

Extension { #name : #ByteArray }

{ #category : #'*bert-rpc-core' }
ByteArray >> asUInt32_t [
	| int |
	int := 0 + ((self at: 1) bitShift: 24).
	int := int + ((self at: 2) bitShift: 16).
	int := int + ((self at: 3) bitShift: 8).
	^int + (self at: 4)
]

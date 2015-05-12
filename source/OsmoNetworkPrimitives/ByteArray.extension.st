Extension { #name : #ByteArray }

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
ByteArray >> shortAt: index [
	"This is not signed right now"
	^self ushortAt: index

]

{ #category : #'*OsmoNetworkPrimitives-Message' }
ByteArray >> toMessageOrByteArray [
	^self

]

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
ByteArray >> uintAt: index [
	| byte1 byte2 byte3 byte4 |
	byte1 := self at: index.
	byte2 := (self at: index + 1) bitShift: 8.
	byte3 := (self at: index + 2) bitShift: 16.
	byte4 := (self at: index + 3) bitShift: 24.
	^((byte4 bitOr: byte3) bitOr: byte2) bitOr: byte1

]

{ #category : #'*OsmoNetworkPrimitives-Pharo' }
ByteArray >> ushortAt: index [
	^((self at: index + 1) bitShift: 8) bitOr: (self at: index)

]

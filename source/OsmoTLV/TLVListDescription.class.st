Class {
	#name : #TLVListDescription,
	#superclass : #TLVDescription,
	#category : #OsmoTLV
}

{ #category : #'as yet unclassified' }
TLVListDescription >> isList [
	^true
]

{ #category : #'as yet unclassified' }
TLVListDescription >> parseFrom: aStream to: aSelf [
	| list |
	self parseClass isNil ifTrue: [^aSelf error: 'No parse class available'].

	"Get the list"
	list := aSelf instVarNamed: self instVarName.
	list ifNil: [
		list := OrderedCollection new].

	list add: (self parseClass readFrom: aStream with: self).
	aSelf instVarNamed: self instVarName put: list.
	^true
]

{ #category : #'as yet unclassified' }
TLVListDescription >> write: aList on: aMsg [
	aList do: [:each |
		super write: each on: aMsg]
	
]

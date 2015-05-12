"
I am a trap
"
Class {
	#name : #CtrlTrap,
	#superclass : #CtrlCmd,
	#category : #OpenBSCControl
}

{ #category : #creation }
CtrlTrap class >> findTrapFor: nodes [
	CtrlTrap allSubclassesDo: 
		[:trap | 
		(trap isFor: nodes third value: nodes fourth) ifTrue: [^trap with: nodes]].
	^CtrlTrap new

]

{ #category : #creation }
CtrlTrap class >> isFor: aPath [
	^self subclassResponsibility

]

{ #category : #'as yet unclassified' }
CtrlTrap class >> isFor: aPath value: aValue [
	^self isFor: aPath

]

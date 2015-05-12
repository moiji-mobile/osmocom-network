Extension { #name : #Integer }

{ #category : #'*OsmoNetwork-Message' }
Integer >> swap16 [
	| tmp |
	tmp := self bitAnd: 16rFFFF.
	^(tmp bitShift: -8) bitOr: ((tmp bitAnd: 16rFF) bitShift: 8)

]

{ #category : #'*OsmoNetwork-Message' }
Integer >> swap32 [
	"Certainly not the most effective way"

	| tmp |
	tmp := 0.
	tmp := tmp bitOr: ((self bitAnd: 16rFF000000) bitShift: -24).
	tmp := tmp bitOr: ((self bitAnd: 16r00FF0000) bitShift: -8).
	tmp := tmp bitOr: ((self bitAnd: 16r0000FF00) bitShift: 8).
	tmp := tmp bitOr: ((self bitAnd: 16r000000FF) bitShift: 24).
	^tmp

]

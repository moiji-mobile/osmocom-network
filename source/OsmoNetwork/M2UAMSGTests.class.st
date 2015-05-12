Class {
	#name : #M2UAMSGTests,
	#superclass : #TestCase,
	#category : #'OsmoNetwork-M2UA-Tests'
}

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testCreateMessage [
	| msg data out res |
	res := #(16r01 16r00 16r03 16r01 16r00 16r00 16r00 16r10 16r00 16r11 16r00 16r08 16rAC 16r10 16r01 16r51) 
		    asByteArray.
	data := #(16rAC 16r10 16r01 16r51) asByteArray.
	msg := M2UAMSG fromClass: M2UAConstants clsASPSM
		    type: M2UAConstants aspsmUp.
	msg addTag: (M2UATag initWith: 16r11 data: data).
	out := msg toMessage asByteArray.
	self assert: out = res

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testCreatePaddingMessage [
	| msg data out res |
	res := #(16r01 16r00 16r03 16r01 16r00 16r00 16r00 16r10 16r00 16r11 16r00 16r07 16rAC 16r10 16r01 16r00) 
		    asByteArray.
	data := #(16rAC 16r10 16r01) asByteArray.
	msg := M2UAMSG fromClass: M2UAConstants clsASPSM
		    type: M2UAConstants aspsmUp.
	msg addTag: (M2UATag initWith: 16r11 data: data).
	out := msg toMessage asByteArray.
	self assert: out = res

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testCreateTag [
	| tag exp |
	tag := M2UATag initWith: 16r11 data: (ByteArray new: 3 withAll: 6).
	exp := #(16r00 16r11 16r00 16r07 16r06 16r06 16r06 16r00) asByteArray.
	self assert: tag toMessage asByteArray = exp

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testFindTag [
	| inp msg tag |
	inp := #(16r01 16r00 16r03 16r01 16r00 16r00 16r00 16r10 16r00 16r11 16r00 16r08 16rAC 16r10 16r01 16r51) 
		    asByteArray.
	msg := M2UAMSG parseFrom: inp.
	tag := msg findTag: M2UAConstants tagReserved ifAbsent: [nil].
	self assert: tag isNil.
	tag := msg findTag: M2UAConstants tagAspIdent ifAbsent: [self fail].
	self deny: tag isNil

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testParseMessage [
	| inp msg |
	inp := #(16r01 16r00 16r03 16r01 16r00 16r00 16r00 16r10 16r00 16r11 16r00 16r08 16rAC 16r10 16r01 16r51) 
		    asByteArray.
	msg := M2UAMSG parseFrom: inp.
	self assert: msg msgClass = UAConstants clsASPSM.
	self assert: msg msgType = UAConstants aspsmUp.
	inp := #(16r01 16r00 16r06 16r01 16r00 16r00 16r00 16r2C 16r00 16r01 16r00 16r08 16r00 16r00 16r00 16r00 16r03 16r00 16r00 16r1A 16r81 16r5C 16r00 16r07 16r00 16r11 16rF0 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16rAA 16r00 16r00) 
		    asByteArray.
	msg := M2UAMSG parseFrom: inp.
	self assert: msg msgClass = UAConstants clsMAUP.
	self assert: msg msgType = UAConstants maupData

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testParseTag [
	| inp tag |
	inp := #(16r00 16r11 16r00 16r08 16rAC 16r10 16r01 16r51) asByteArray.
	tag := M2UATag fromStream: inp readStream.
	self assert: tag nr = 16r11.
	self assert: tag data = #(16rAC 16r10 16r01 16r51) asByteArray

]

{ #category : #'as yet unclassified' }
M2UAMSGTests >> testUnique [
	"This should have some sanity checks on the enum"

]

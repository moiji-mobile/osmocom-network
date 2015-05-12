Class {
	#name : #IPAMsgTests,
	#superclass : #TestCase,
	#category : #'OsmoNetwork-Tests'
}

{ #category : #'test-data' }
IPAMsgTests class >> data [
	^Array with: IPAMsgRequest 
		    -> #(16r04 16r01 16r08 16r01 16r07 16r01 16r02 16r01 16r03 16r01 16r04 16r01 16r05 16r01 16r01 16r01 16r00)
	    with: IPAMsgResponse -> #(16r05 16r00 16r04 16r01 16r31 16r38 16r30 16r31)

]

{ #category : #'as yet unclassified' }
IPAMsgTests class >> parseOnlyData [
	^Array with: IPAMsgResponse 
		    -> #(16r05 16r00 16r0A 16r08 16r31 16r38 16r30 16r31 16r2F 16r30 16r2F 16r30 16r00 16r00 16r13 16r07 16r30 16r30 16r3A 16r30 16r32 16r3A 16r39 16r35 16r3A 16r30 16r30 16r3A 16r34 16r30 16r3A 16r36 16r34 16r00 16r00 16r02 16r02 16r00 16r00 16r0D 16r03 16r42 16r54 16r53 16r5F 16r4E 16r42 16r54 16r31 16r33 16r31 16r47 16r00 16r00 16r0C 16r04 16r31 16r36 16r35 16r61 16r30 16r32 16r39 16r5F 16r35 16r35 16r00 16r00 16r14 16r05 16r31 16r36 16r38 16r64 16r34 16r37 16r32 16r5F 16r76 16r32 16r30 16r30 16r62 16r31 16r34 16r33 16r64 16r30 16r00 16r00 16r18 16r01 16r6E 16r62 16r74 16r73 16r2D 16r30 16r30 16r2D 16r30 16r32 16r2D 16r39 16r35 16r2D 16r30 16r30 16r2D 16r34 16r30 16r2D 16r36 16r34 16r00 16r00 16r0A 16r00 16r30 16r30 16r31 16r30 16r32 16r37 16r32 16r39 16r00)

]

{ #category : #'as yet unclassified' }
IPAMsgTests >> testMsgDissect [
	self class data do: 
		[:test_data | 
		| msg stream |
		stream := test_data value readStream.
		msg := test_data key parse: stream.
		self
		    assert: stream atEnd;
		    assert: msg toMessage asByteArray = test_data value asByteArray;
		    should: [msg dataForTag: 9] raise: NotFound;
		    deny: (msg hasTag: 9)]

]

{ #category : #'as yet unclassified' }
IPAMsgTests >> testMsgInputStrict [
	| test_data msg stream |
	test_data := self class data first.
	stream := test_data value readStream.
	msg := test_data key parse: stream.
	self
	    assert: stream atEnd;
	    assert: msg tags = #(8 7 2 3 4 5 1 0) asOrderedCollection;
	    assert: (msg hasTag: 8);
	    assert: (msg dataForTag: 8) = nil

]

{ #category : #'as yet unclassified' }
IPAMsgTests >> testParseOnly [
	"This tests that parsing a 'malformed' response will actually
	 work, generating the response will be different though."

	self class parseOnlyData do: 
		[:test_data | 
		| msg stream |
		stream := test_data value readStream.
		msg := test_data key parse: stream.
		self
		    assert: stream atEnd;
		    assert: (msg hasTag: 16r0);
		    assert: (msg hasTag: 16r1);
		    assert: (msg hasTag: 16r2);
		    assert: (msg hasTag: 16r3);
		    assert: (msg hasTag: 16r4);
		    assert: (msg hasTag: 16r5);
		    assert: (msg hasTag: 16r7);
		    assert: (msg hasTag: 16r8);
		    deny: (msg hasTag: 16rA);
		    assert: (msg dataForTag: 16r0) 
				= #(16r30 16r30 16r31 16r30 16r32 16r37 16r32 16r39 16r0) asByteArray]

]

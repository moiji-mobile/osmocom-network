"
I was written on a flight to Taipei. I will try to
    instantiate all generated class and walk the hierachy to see if
    there are any DNUs
"
Class {
	#name : #ISUPGeneratedTest,
	#superclass : #TestCase,
	#category : #'ISUP-Tests'
}

{ #category : #'as yet unclassified' }
ISUPGeneratedTest >> playWith: aField [
	aField name.
	aField parameterValue.
	aField octalLength.
	self assert: aField isVarible ~= aField isFixed.
	aField isVarible ifTrue: [aField maxLength]

]

{ #category : #'as yet unclassified' }
ISUPGeneratedTest >> testClassCount [
	self assert: ISUPMessage allSubclasses size = 46

]

{ #category : #'as yet unclassified' }
ISUPGeneratedTest >> testDecode [
	| decode struct data |
	decode := #(16r15 16r00 16r01 16r00 16r00 16r00 16r0A 16r00 16r02 16r0B 16r09 16r04 16r10 16r00 16r19 16r79 16r64 16r64 16r64 16r78 16r0A 16r09 16r02 16r13 16r00 16r79 16r51 16r20 16r01 16r79 16r42 16r00) 
		    asByteArray.
	struct := ISUPMessage decodeByteStream: decode readStream.
	data := ISUPMessage encodeCollection: struct.
	self assert: data asByteArray = decode

]

{ #category : #'as yet unclassified' }
ISUPGeneratedTest >> testGeneration [
	ISUPMessage allSubclassesDo: 
		[:class | 
		| struct |
		struct := class tlvDescription.
		struct fixed do: [:each | self playWith: each].
		struct variable do: [:each | self playWith: each].
		struct optional do: [:each | self playWith: each].
		struct optionals do: [:each | self playWith: each].

		"same thing once more"
		struct fieldsDo: [:type :field_class | self playWith: field_class]]

]

{ #category : #'as yet unclassified' }
ISUPGeneratedTest >> testSpecParmameterNameSmokeTest [
	MSGField allSubclassesDo: 
		[:class | 
		class category = 'OsmoNetwork-ISUP' 
		    ifTrue: 
			[self
			    assert: class parameterName isString;
			    assert: class spec isString]]

]

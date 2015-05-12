Class {
	#name : #SCCPTests,
	#superclass : #TestCase,
	#category : #'OsmoNetwork-Tests'
}

{ #category : #accessing }
SCCPTests class >> packageNamesUnderTest [
	^#('OsmoNetwork')

]

{ #category : #'as yet unclassified' }
SCCPTests >> testAddrFromByteArray [
	| byte |
	byte := #(191 0 3) asByteArray.
	self assert: (SCCPAddrReference fromByteArray: byte) = 16r0300BF

]

{ #category : #'as yet unclassified' }
SCCPTests >> testAddrGTIFromByteArrray [
	| addr parsed gti |
	addr := #(16r0A 16r12 16r06 16r0 16r12 16r04 16r53 16r84 16r09 16r00 16r37) 
		    asByteArray.
	parsed := SCCPAddress parseFrom: addr.
	self assert: parsed ssn = SCCPAddress ssnHLR.
	self assert: parsed asByteArray = addr.

	"Now test the GTI parsing"
	gti := parsed gtiAsParsed.
	self assert: gti translation = 0.
	self assert: gti plan = SCCPGlobalTitle npISDN.
	self assert: gti nature = SCCPGlobalTitle naiInternationalNumber.
	self assert: gti addr = '3548900073'.
	parsed gtiFromAddr: gti.
	self assert: parsed asByteArray = addr

]

{ #category : #'as yet unclassified' }
SCCPTests >> testAddrGTIOdd [
	| addr parsed gti |
	addr := #(16r0B 16r12 16r08 16r00 16r11 16r04 16r64 16r07 16r97 16r36 16r71 16r03) 
		    asByteArray.
	parsed := SCCPAddress parseFrom: addr.
	self assert: parsed ssn = SCCPAddress ssnMSC.
	self assert: parsed asByteArray = addr.

	"GTI encoding.."
	gti := parsed gtiAsParsed.
	self assert: gti translation = 0.
	self assert: gti plan = SCCPGlobalTitle npISDN.
	self assert: gti nature = SCCPGlobalTitle naiInternationalNumber.
	self assert: gti addr = '46707963173'.
	parsed gtiFromAddr: gti.
	self assert: parsed asByteArray = addr

]

{ #category : #'as yet unclassified' }
SCCPTests >> testCC [
	| target cc |
	target := #(2 191 0 3 1 3 176 2 1 0) asByteArray.
	cc := SCCPConnectionConfirm initWithSrc: 16rB00301 dst: 16r0300BF.
	self assert: cc toMessage asByteArray = target.
	cc := SCCPMessage decode: target.
	self assert: (cc isKindOf: SCCPConnectionConfirm).
	self assert: cc dst = 16r0300BF.
	self assert: cc src = 16rB00301.
	self assert: cc toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testCR [
	| cr msg target |
	target := #(1 191 0 3 2 2 4 2 66 254 15 4 49 50 51 52 0) asByteArray.

	"encode it"
	cr := SCCPConnectionRequest 
		    initWith: 16r0300BF
		    dest: (SCCPAddress createWith: 254)
		    data: '1234' asByteArray.
	msg := cr toMessage asByteArray.
	self assert: msg = target.

	"now decode it"
	cr := SCCPMessage decode: target.
	self assert: (cr isKindOf: SCCPConnectionRequest).
	self assert: cr src = 16r0300BF.
	self 
	    assert: cr dest asByteArray = (SCCPAddress createWith: 254) asByteArray.
	self assert: cr data = '1234' asByteArray.

	"now encode it again"
	self assert: cr toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testCREF [
	| target cref |
	target := #[3 26 0 3 0 1 0].
	cref := SCCPConnectionRefused initWithDst: 16r03001A cause: 16r00.
	self assert: cref toMessage asByteArray = target.
	cref := SCCPMessage decode: target.
	self assert: (cref isKindOf: SCCPConnectionRefused).
	self assert: cref dst = 16r03001A

]

{ #category : #'as yet unclassified' }
SCCPTests >> testCreateForSSN [
	| addr |
	addr := SCCPAddress createForSSN: 'hlr'.
	self assert: addr subSystemNumber = SCCPAddress ssnHLR.
	self assert: addr routedOnSSN.
	self assert: addr globalTitle isNil.
	self assert: addr pointCode isNil

]

{ #category : #'as yet unclassified' }
SCCPTests >> testCreateRLSD [
	| target rlsd |
	target := #(4 154 2 0 66 5 5 0 1 0) asByteArray.
	rlsd := SCCPHelper 
		    createRLSD: 16r50542
		    dest: 16r0029A
		    cause: 0.
	self assert: rlsd asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testDT1 [
	| dt1 msg target |
	target := #(6 1 4 0 0 1 4 49 50 51 52) asByteArray.
	dt1 := SCCPConnectionData initWith: 16r401 data: '1234' asByteArray.
	msg := dt1 toMessage asByteArray.
	self assert: msg = target.
	dt1 := SCCPMessage decode: target.
	self assert: dt1 dst = 16r401.
	self assert: dt1 data = '1234' asByteArray.
	self assert: dt1 toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testIT [
	| target it |
	target := #(16 1 3 176 191 0 3 240 36 66 239) asByteArray.
	it := SCCPMessage decode: target.
	self assert: it src = 16r0300BF.
	self assert: it dst = 16rB00301.
	self assert: it credit = 16rEF.
	self assert: it seq = #(16r24 16r42) asByteArray.
	self assert: it protoClass = 16rF0.
	self assert: it toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testPNCCreate [
	| pnc |
	pnc := SCCPPNC new.
	pnc at: SCCPHelper pncData put: #(1 2 3) asByteArray.
	self assert: pnc toMessage asByteArray = #(15 3 1 2 3 0) asByteArray

]

{ #category : #'as yet unclassified' }
SCCPTests >> testReleasedFormat [
	| rlsd msg |
	rlsd := SCCPConnectionReleased 
		    initWithDst: 16r401
		    src: 16r1F0A01
		    cause: 16rFE.
	msg := rlsd toMessage asByteArray.
	self assert: msg = #(4 1 4 0 1 16r0A 16r1F 16rFE 1 0) asByteArray

]

{ #category : #'as yet unclassified' }
SCCPTests >> testRlc [
	| target rlc |
	target := #(5 1 8 119 62 4 5) asByteArray.
	rlc := SCCPConnectionReleaseComplete initWithDst: 16r770801 src: 16r05043E.
	self assert: rlc toMessage asByteArray = target.
	rlc := SCCPMessage decode: target.
	self assert: rlc dst = 16r770801.
	self assert: rlc src = 16r05043E.
	self assert: rlc toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testRlsd [
	| target rlsd |
	target := #(4 154 2 0 66 5 5 0 1 0) asByteArray.
	rlsd := SCCPConnectionReleased 
		    initWithDst: 16r0029A
		    src: 16r50542
		    cause: 0.
	self assert: rlsd toMessage asByteArray = target.
	rlsd := SCCPMessage decode: target.
	self assert: rlsd dst = 16r0029A.
	self assert: rlsd src = 16r50542.
	self assert: rlsd cause = 0.
	self assert: rlsd toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testUDTClass [
	| target udt |
	target := #(9 129 3 13 24 10 18 6 0 18 4 83 132 9 0 55 11 18 7 0 18 4 54 25 8 0 4 49 70 100 68 73 4 81 1 3 78 107 42 40 40 6 7 0 17 134 5 1 1 1 160 29 97 27 128 2 7 128 161 9 6 7 4 0 0 1 0 27 3 162 3 2 1 0 163 5 161 3 2 1 0 108 128 162 12 2 1 64 48 7 2 1 67 48 2 128 0 0 0) 
		    asByteArray.
	udt := SCCPMessage decode: target.
	self assert: udt udtClass = 1.
	self assert: udt errorHandling = 8.
	self assert: udt toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testUdt [
	| target udt called calling |
	target := #(9 0 3 7 11 4 67 7 0 254 4 67 92 0 254 3 1 2 3) asByteArray.
	called := SCCPAddress createWith: 254 pointCode: 7.
	calling := SCCPAddress createWith: 254 pointCode: 92.
	udt := SCCPUDT 
		    initWith: called
		    calling: calling
		    data: #(1 2 3) asByteArray.
	self assert: udt toMessage asByteArray = target.
	udt := SCCPMessage decode: target.
	self assert: (udt isKindOf: SCCPUDT).
	self assert: udt calledAddr ssn = 254.
	self assert: udt calledAddr pointCode = 7.
	self assert: udt callingAddr ssn = 254.
	self assert: udt callingAddr pointCode = 92.
	self assert: udt toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testUdts [
	| target udts called calling |
	target := #[10 1 3 13 26 10 18 7 0 18 4 83 132 9 0 23 13 18 6 0 114 4 25 137 2 17 8 70 3 118 3 1 2 3].
	called := (SCCPAddress createForSSN: #vlr)
                routedOnSSN: false;
                gtiFromAddr:  (SCCPGlobalTitleTranslation new
                                                        nature: SCCPGlobalTitle naiInternationalNumber;
                                                        plan: SCCPGlobalTitle npISDN;
                                                        addr: '3548900071';
                                                        translation: 0;
                                                        yourself);
                yourself.
	calling := (SCCPAddress createForSSN: #hlr)
                routedOnSSN: false;
                gtiFromAddr:  (SCCPGlobalTitleTranslation new
                                                        nature: SCCPGlobalTitle naiInternationalNumber;
                                                        plan: SCCPGlobalTitle npMobile;
                                                        addr: '9198201180643067';
                                                        translation: 0;
                                                        yourself);
                yourself.
	udts := SCCPUDTS
		    initWith: called
		    calling: calling
	          returnCause: 1
		    data: #[1 2 3].
	self assert: udts toMessage asByteArray = target.
	udts := SCCPMessage decode: target.
	self assert: (udts isKindOf: SCCPUDTS).
	self assert: udts calledAddr ssn equals: SCCPAddress ssnVLR.
	self assert: udts callingAddr ssn equals: SCCPAddress ssnHLR.
	self assert: udts data equals: #[1 2 3].
	self assert: udts toMessage asByteArray = target

]

{ #category : #'as yet unclassified' }
SCCPTests >> testUdtsRead [
	| target udts called calling |
	target := #[10 1 17 2 26 13 18 6 0 114 4 25 137 2 17 8 70 3 118 10 18 7 0 18 4 83 132 9 0 23 3 1 2 3].
	called := (SCCPAddress createForSSN: #vlr)
                routedOnSSN: false;
                gtiFromAddr:  (SCCPGlobalTitleTranslation new
                                                        nature: SCCPGlobalTitle naiInternationalNumber;
                                                        plan: SCCPGlobalTitle npISDN;
                                                        addr: '3548900071';
                                                        translation: 0;
                                                        yourself);
                yourself.
	calling := (SCCPAddress createForSSN: #hlr)
                routedOnSSN: false;
                gtiFromAddr:  (SCCPGlobalTitleTranslation new
                                                        nature: SCCPGlobalTitle naiInternationalNumber;
                                                        plan: SCCPGlobalTitle npMobile;
                                                        addr: '9198201180643067';
                                                        translation: 0;
                                                        yourself);
                yourself.

	udts := SCCPMessage decode: target.
	self assert: (udts isKindOf: SCCPUDTS).
	self assert: udts data equals: #[1 2 3].
	self assert: udts calledAddr ssn equals: SCCPAddress ssnVLR.
	self assert: udts callingAddr ssn equals: SCCPAddress ssnHLR.

]

{ #category : #'as yet unclassified' }
SCCPTests >> testXUdt [
	| target xudt   |
	target := #[17 129 2 4 17 28 0 13 82 6 0 97 4 21 16 128 33 53 152 85 8 11 18 149 0 17 4 38 24 1 48 8 1 68 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68].
	xudt := SCCPMessage decode: target.
	self assert: xudt toMessage asByteArray equals: target.
	self deny: xudt isSegmented.

	"With segmentation"
	target := #[17 129 13 4 14 25 248 10 82 6 0 18 4 38 24 1 21 9 11 18 147 0 17 4 38 24 1 102 104 7 223 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 16 4 193 200 118 79 0].
	xudt := SCCPMessage decode: target.
	self assert: xudt toMessage asByteArray equals: target.
	self assert: xudt isSegmented.
	self assert: xudt parseSegmentation firstSegment.
	self assert: xudt parseSegmentation remainingSegments equals: 1.
	self assert: xudt parseSegmentation sourceReference equals: #[200 118 79].
]

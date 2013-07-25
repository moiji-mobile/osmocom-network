"
MTP3Message is a codec class for the MessageTransferPart as of Q.701-Q.704, Q.706 and Q.707. Currently only the ITU version will be supported.
The spec is really difficult to read a MTP3 Message will have:
    DCBA (MTPSubservice         4bit)
    DCBA (MTPServiceIndicator   4bit)
    Label (MTP3Label            32bit)
    H0     (4bit)
    H1     (4bit)
    DATA
"
Class {
	#name : #MTP3NetworkManagementMSG,
	#superclass : #MTP3MSG,
	#category : #'MTP3-Codec'
}

{ #category : #parsing }
MTP3NetworkManagementMSG class >> findClassForHeading: aHeading [
	"We need to find a matching class now"
	self subclassesDo: [:each |
		each h0 = aHeading h0 ifTrue: [
			each subclassesDo: [:sub |
				sub h1 = aHeading h1
					ifTrue: [^sub]]]].

	^self error: 'Unknown heading h0/h1'.

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Chm [
	^2r0001

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Dlm [
	^2r1000

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Ecm [
	^2r0010

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Fcm [
	^2r0011

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Mim [
	^2r0110

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Rsm [
	^2r0101

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Tfm [
	^2r0100

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Trm [
	^2r0111

]

{ #category : #h0 }
MTP3NetworkManagementMSG class >> h0Ufc [
	^2r1010

]

{ #category : #h1CHM }
MTP3NetworkManagementMSG class >> h1CBA [
	^2r0110

]

{ #category : #h1CHM }
MTP3NetworkManagementMSG class >> h1CBD [
	^2r0101

]

{ #category : #h1DLM }
MTP3NetworkManagementMSG class >> h1CNP [
	^2r0100

]

{ #category : #h1DLM }
MTP3NetworkManagementMSG class >> h1CNS [
	^2r0011

]

{ #category : #h1CHM }
MTP3NetworkManagementMSG class >> h1COA [
	^2r0010

]

{ #category : #h1CHM }
MTP3NetworkManagementMSG class >> h1COO [
	^2r0001

]

{ #category : #h1DLM }
MTP3NetworkManagementMSG class >> h1CSS [
	^2r0010

]

{ #category : #h1DLM }
MTP3NetworkManagementMSG class >> h1DLC [
	^2r0001

]

{ #category : #h1ECM }
MTP3NetworkManagementMSG class >> h1ECA [
	^2r0010

]

{ #category : #h1ECM }
MTP3NetworkManagementMSG class >> h1ECO [
	^2r0001

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LFU [
	^2r0110

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LIA [
	^2r0011

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LID [
	^2r0101

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LIN [
	^2r0001

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LLT [
	^2r0111

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LRT [
	^2r1000

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LUA [
	^2r0100

]

{ #category : #h1MIM }
MTP3NetworkManagementMSG class >> h1LUN [
	^2r0010

]

{ #category : #h1FCM }
MTP3NetworkManagementMSG class >> h1RCT [
	^2r0001

]

{ #category : #h1RSM }
MTP3NetworkManagementMSG class >> h1RSR [
	^2r0010

]

{ #category : #h1RSM }
MTP3NetworkManagementMSG class >> h1RST [
	^2r0001

]

{ #category : #h1TFM }
MTP3NetworkManagementMSG class >> h1TFA [
	^2r0101

]

{ #category : #h1FCM }
MTP3NetworkManagementMSG class >> h1TFC [
	^2r0010

]

{ #category : #h1TFM }
MTP3NetworkManagementMSG class >> h1TFP [
	^2r0001

]

{ #category : #h1TFM }
MTP3NetworkManagementMSG class >> h1TFR [
	^2r0011

]

{ #category : #h1TRM }
MTP3NetworkManagementMSG class >> h1TRA [
	^2r0001

]

{ #category : #h1UFC }
MTP3NetworkManagementMSG class >> h1UPU [
	^2r0001

]

{ #category : #parsing }
MTP3NetworkManagementMSG class >> isServiceCompatible: aServiceIndicator [
	^aServiceIndicator serviceIndicator 
	    = MTP3ServiceIndicators signallingNetworkManagement

]

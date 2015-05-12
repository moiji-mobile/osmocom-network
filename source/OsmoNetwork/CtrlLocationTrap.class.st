"
I handle location traps
"
Class {
	#name : #CtrlLocationTrap,
	#superclass : #CtrlTrap,
	#instVars : [
		'net_nr',
		'bsc_nr',
		'bts_nr',
		'location'
	],
	#category : #'OsmoNetwork-Control'
}

{ #category : #creation }
CtrlLocationTrap class >> isFor: aPath [
	^aPath last first = 'location-state'

]

{ #category : #'as yet unclassified' }
CtrlLocationTrap class >> with: aList [
	^(self new)
	    net: (aList third at: 2) first;
	    bsc: (aList third at: 4) first;
	    bts: (aList third at: 6) first;
	    location: aList fourth;
	    yourself

]

{ #category : #accessing }
CtrlLocationTrap >> bsc [
	^bsc_nr

]

{ #category : #private }
CtrlLocationTrap >> bsc: aStr [
	bsc_nr := aStr asNumber

]

{ #category : #'as yet unclassified' }
CtrlLocationTrap >> bts [
	^bts_nr

]

{ #category : #private }
CtrlLocationTrap >> bts: aBts [
	bts_nr := aBts asNumber

]

{ #category : #accessing }
CtrlLocationTrap >> locHeight [
	^location at: 5

]

{ #category : #accessing }
CtrlLocationTrap >> locLat [
	^location at: 3

]

{ #category : #accessing }
CtrlLocationTrap >> locLon [
	^location at: 4

]

{ #category : #accessing }
CtrlLocationTrap >> locState [
	^location at: 2

]

{ #category : #accessing }
CtrlLocationTrap >> locTimeStamp [
	^location at: 1

]

{ #category : #private }
CtrlLocationTrap >> location: aLoc [
	location := aLoc subStrings: ','.
	location size = 8 ifFalse: [^self error: 'Failed to parse location']

]

{ #category : #accessing }
CtrlLocationTrap >> net [
	^net_nr

]

{ #category : #private }
CtrlLocationTrap >> net: aStr [
	net_nr := aStr asNumber

]

{ #category : #accessing }
CtrlLocationTrap >> rfPolicy [
	^location at: 8

]

{ #category : #accessing }
CtrlLocationTrap >> rfPolicyGrace [
	^self rfPolicy = 'grace'

]

{ #category : #accessing }
CtrlLocationTrap >> rfPolicyOff [
	^self rfPolicy = 'off'

]

{ #category : #accessing }
CtrlLocationTrap >> rfPolicyOn [
	^self rfPolicy = 'on'

]

{ #category : #accessing }
CtrlLocationTrap >> rfPolicyUnknown [
	^self rfPolicy = 'unknown'

]

{ #category : #accessing }
CtrlLocationTrap >> trxAdminLock [
	^(location at: 7) = 'locked'

]

{ #category : #accessing }
CtrlLocationTrap >> trxAvailable [
	^(location at: 6) = 'operational'

]

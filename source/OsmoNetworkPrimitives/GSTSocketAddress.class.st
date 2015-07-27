"
Helper to look a bit like GST on Pharo..
"
Class {
	#name : #GSTSocketAddress,
	#superclass : #Object,
	#category : #'OsmoNetworkPrimitives-Pharo'
}

{ #category : #'as yet unclassified' }
GSTSocketAddress class >> byName: aName [
	^NetNameResolver addressForName: aName

]

{ #category : #'as yet unclassified' }
GSTSocketAddress class >> localHostName [
	^NetNameResolver localHostName

]

{ #category : #'as yet unclassified' }
GSTSocketAddress class >> loopbackHost [
	^'127.0.0.1'

]

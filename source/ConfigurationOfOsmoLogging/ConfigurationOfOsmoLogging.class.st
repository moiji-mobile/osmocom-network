Class {
	#name : #ConfigurationOfOsmoLogging,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfOsmoLogging
}

{ #category : #'development support' }
ConfigurationOfOsmoLogging class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfOsmoLogging class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfOsmoLogging class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfOsmoLogging class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfOsmoLogging class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfOsmoLogging class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfOsmoLogging class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfOsmoLogging class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfOsmoLogging class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfOsmoLogging class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfOsmoLogging >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/'.
		spec 
			package: #OsmoLogging;
			package: 'OsmoSyslog' with: [
				spec requires: #(#OsmoLogging ). ].
		spec group: 'default' with: #(#OsmoLogging 'OsmoSyslog' ). ].

]

{ #category : #baselines }
ConfigurationOfOsmoLogging >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/'.
		spec 
			package: #OsmoLogging;
			package: 'OsmoSyslog' with: [
				spec requires: #(#OsmoLogging ). ].
		spec group: 'default' with: #(#OsmoLogging 'OsmoSyslog' ). ].

]

{ #category : #accessing }
ConfigurationOfOsmoLogging >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfOsmoLogging >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfOsmoLogging >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfOsmoLogging >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '4'.

]

{ #category : #versions }
ConfigurationOfOsmoLogging >> version1: spec [
	<version: '1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/8/2016 11:36'.
		spec 
			package: #OsmoLogging with: 'OsmoLogging-HolgerHansPeterFreyther.9';
			package: 'OsmoSyslog' with: 'OsmoSyslog-HolgerHansPeterFreyther.6'. ].

]

{ #category : #versions }
ConfigurationOfOsmoLogging >> version2: spec [
	<version: '2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 2'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '4/30/2016 21:44'.
		spec 
			package: #OsmoLogging with: 'OsmoLogging-HolgerHansPeterFreyther.10';
			package: 'OsmoSyslog' with: 'OsmoSyslog-HolgerHansPeterFreyther.6'. ].

]

{ #category : #versions }
ConfigurationOfOsmoLogging >> version3: spec [
	<version: '3' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 3'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '10/20/2016 23:09'.
		spec 
			package: #OsmoLogging with: 'OsmoLogging-HolgerHansPeterFreyther.10';
			package: 'OsmoSyslog' with: 'OsmoSyslog-HolgerHansPeterFreyther.7'. ].

]

{ #category : #'as yet unclassified' }
ConfigurationOfOsmoLogging >> version4: spec [
	<version: '4' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 4'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '03/12/2017 12:20'.
		spec 
			package: #OsmoLogging with: 'OsmoLogging-HolgerHansPeterFreyther.11';
			package: 'OsmoSyslog' with: 'OsmoSyslog-HolgerHansPeterFreyther.7'. ].

]

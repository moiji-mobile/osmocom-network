Class {
	#name : #ConfigurationOfOsmoNetwork,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfOsmoNetwork
}

{ #category : #'development support' }
ConfigurationOfOsmoNetwork class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfOsmoNetwork class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfOsmoNetwork class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfOsmoNetwork class >> ensureMetacelloBaseConfiguration [

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
ConfigurationOfOsmoNetwork class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfOsmoNetwork class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfOsmoNetwork class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfOsmoNetwork class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfOsmoNetwork class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfOsmoNetwork class >> validate [
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
ConfigurationOfOsmoNetwork >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/'.
		spec 
			project: 'OsmoCore' with: [
				spec
					className: #ConfigurationOfOsmoCore;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Core/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' 'Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
		spec 
			package: #OsmoNetworkPrimitives with: [
				spec requires: #('OsmoLogging' ). ];
			package: #SCCP with: [
				spec requires: #('OsmoLogging' ). ];
			package: #OpenBSCControl with: [
				spec requires: #('OsmoLogging' 'PetitParser' ). ];
			package: #OsmoTLV;
			package: #ISUP with: [
				spec requires: #(#OsmoNetworkPrimitives #OsmoTLV ). ];
			package: #M2UA with: [
				spec requires: #('OsmoCore' 'OsmoLogging' #OsmoNetworkPrimitives ). ];
			package: #M3UA;
			package: #IPA with: [
				spec requires: #('OsmoLogging' #OsmoNetworkPrimitives ). ];
			package: #OsmoSocket with: [
				spec requires: #(#IPA 'OsmoCore' ). ];
			package: #SCTP with: [
				spec requires: #(#OsmoSocket ). ];
			package: #'NS-Core' with: [
				spec requires: #(#SCCP #IPA #OsmoSocket ). ].
		spec 
			group: 'default' with: #(#OsmoNetworkPrimitives #OsmoSocket #OsmoTLV #SCCP #'NS-Core' #SCTP #IPA );
			group: 'isup' with: #('default' #ISUP );
			group: 'm2ua' with: #('default' #M2UA );
			group: 'm3ua' with: #('default' #M3UA );
			group: 'control' with: #('default' #OpenBSCControl );
			group: 'all' with: #('default' 'isup' 'm2ua' 'm3ua' 'control' ). ].

]

{ #category : #accessing }
ConfigurationOfOsmoNetwork >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfOsmoNetwork >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfOsmoNetwork >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

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
				spec requires: #(#SCCP #IPA #OsmoSocket #'MTP3-LinkHandling' ). ];
			package: #'MTP3-Codec' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' ). ];
			package: #'MTP3-LinkHandling' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' #'MTP3-Codec' ). ].
		spec 
			group: 'default' with: #(#OsmoNetworkPrimitives #OsmoSocket #OsmoTLV #SCCP #'NS-Core' #SCTP #IPA );
			group: 'isup' with: #('default' #ISUP );
			group: 'm2ua' with: #('default' #M2UA );
			group: 'm3ua' with: #('default' #M3UA );
			group: 'control' with: #('default' #OpenBSCControl );
			group: 'all' with: #('default' 'isup' 'm2ua' 'm3ua' 'control' ). ].

]

{ #category : #baselines }
ConfigurationOfOsmoNetwork >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/'.
		spec 
			project: 'OsmoCore' with: [
				spec
					className: #ConfigurationOfOsmoCore;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/Core/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'stable';
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
			package: #'MTP3-Codec' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' ). ];
			package: #'MTP3-LinkHandling' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' #'MTP3-Codec' ). ];
			package: #'NS-Core' with: [
				spec requires: #(#SCCP #IPA #OsmoSocket #'MTP3-LinkHandling' ). ].
		spec 
			group: 'default' with: #(#OsmoNetworkPrimitives #OsmoSocket #OsmoTLV #SCCP #'NS-Core' #SCTP #IPA );
			group: 'isup' with: #('default' #ISUP );
			group: 'm2ua' with: #('default' #M2UA );
			group: 'm3ua' with: #('default' #M3UA );
			group: 'control' with: #('default' #OpenBSCControl );
			group: 'all' with: #('default' 'isup' 'm2ua' 'm3ua' 'control' ). ].

]

{ #category : #baselines }
ConfigurationOfOsmoNetwork >> baseline03: spec [
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/'.
		spec 
			project: 'OsmoCore' with: [
				spec
					className: #ConfigurationOfOsmoCore;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/Core/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'stable';
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
			package: #'MTP3-Codec' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' ). ];
			package: #'MTP3-LinkHandling' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' #'MTP3-Codec' ). ];
			package: #'NS-Core' with: [
				spec requires: #(#SCCP #IPA #OsmoSocket #'MTP3-LinkHandling' ). ].
		spec 
			group: 'default' with: #(#OsmoNetworkPrimitives #OsmoSocket #OsmoTLV #SCCP #'NS-Core' #SCTP #IPA );
			group: 'isup' with: #('default' #ISUP );
			group: 'm2ua' with: #('default' #M2UA );
			group: 'm3ua' with: #('default' #M3UA );
			group: 'control' with: #('default' #OpenBSCControl );
			group: 'all' with: #('default' 'isup' 'm2ua' 'm3ua' 'control' ). ].

]

{ #category : #baselines }
ConfigurationOfOsmoNetwork >> baseline04: spec [
	<version: '0.4-baseline'>

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
			package: #'MTP3-Codec' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' ). ];
			package: #'MTP3-LinkHandling' with: [
				spec requires: #('OsmoCore' 'OsmoLogging' #'MTP3-Codec' ). ];
			package: #'NS-Core' with: [
				spec requires: #(#SCCP #IPA #OsmoSocket #'MTP3-LinkHandling' ). ].
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

	spec for: #'common' version: '0.4-baseline'.

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

{ #category : #'symbolic versions' }
ConfigurationOfOsmoNetwork >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '4'.

]

{ #category : #versions }
ConfigurationOfOsmoNetwork >> version1: spec [
	<version: '1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/8/2016 13:07'.
		spec 
			project: 'OsmoCore' with: '1';
			project: 'OsmoLogging' with: '1';
			project: 'PetitParser' with: '1.14'.
		spec 
			package: #OsmoNetworkPrimitives with: 'OsmoNetworkPrimitives-HolgerHansPeterFreyther.7';
			package: #SCCP with: 'SCCP-HolgerHansPeterFreyther.3';
			package: #OpenBSCControl with: 'OpenBSCControl-HolgerHansPeterFreyther.1';
			package: #OsmoTLV with: 'OsmoTLV-HolgerHansPeterFreyther.3';
			package: #ISUP with: 'ISUP-HolgerHansPeterFreyther.1';
			package: #M2UA with: 'M2UA-HolgerHansPeterFreyther.1';
			package: #M3UA with: 'M3UA-HolgerHansPeterFreyther.1';
			package: #IPA with: 'IPA-HolgerHansPeterFreyther.1';
			package: #OsmoSocket with: 'OsmoSocket-HolgerHansPeterFreyther.19';
			package: #SCTP with: 'SCTP-HolgerHansPeterFreyther.1';
			package: #'MTP3-Codec' with: 'MTP3-Codec-HolgerHansPeterFreyther.1';
			package: #'MTP3-LinkHandling' with: 'MTP3-LinkHandling-HolgerHansPeterFreyther.16';
			package: #'NS-Core' with: 'NS-Core-HolgerHansPeterFreyther.17'. ].

]

{ #category : #versions }
ConfigurationOfOsmoNetwork >> version2: spec [
	<version: '2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 2'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/13/2016 22:35'.
		spec 
			project: 'OsmoCore' with: '1';
			project: 'OsmoLogging' with: '1';
			project: 'PetitParser' with: '1.14'.
		spec 
			package: #OsmoNetworkPrimitives with: 'OsmoNetworkPrimitives-HolgerHansPeterFreyther.7';
			package: #SCCP with: 'SCCP-HolgerHansPeterFreyther.3';
			package: #OpenBSCControl with: 'OpenBSCControl-HolgerHansPeterFreyther.1';
			package: #OsmoTLV with: 'OsmoTLV-HolgerHansPeterFreyther.3';
			package: #ISUP with: 'ISUP-HolgerHansPeterFreyther.1';
			package: #M2UA with: 'M2UA-HolgerHansPeterFreyther.1';
			package: #M3UA with: 'M3UA-HolgerHansPeterFreyther.1';
			package: #IPA with: 'IPA-HolgerHansPeterFreyther.1';
			package: #OsmoSocket with: 'OsmoSocket-HolgerHansPeterFreyther.20';
			package: #SCTP with: 'SCTP-HolgerHansPeterFreyther.1';
			package: #'MTP3-Codec' with: 'MTP3-Codec-HolgerHansPeterFreyther.1';
			package: #'MTP3-LinkHandling' with: 'MTP3-LinkHandling-HolgerHansPeterFreyther.16';
			package: #'NS-Core' with: 'NS-Core-HolgerHansPeterFreyther.18'. ].

]

{ #category : #versions }
ConfigurationOfOsmoNetwork >> version3: spec [
	<version: '3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 3'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/14/2016 19:35'.
		spec 
			project: 'OsmoCore' with: '1';
			project: 'OsmoLogging' with: '1';
			project: 'PetitParser' with: '1.14'.
		spec 
			package: #OsmoNetworkPrimitives with: 'OsmoNetworkPrimitives-HolgerHansPeterFreyther.7';
			package: #SCCP with: 'SCCP-HolgerHansPeterFreyther.3';
			package: #OpenBSCControl with: 'OpenBSCControl-HolgerHansPeterFreyther.1';
			package: #OsmoTLV with: 'OsmoTLV-HolgerHansPeterFreyther.3';
			package: #ISUP with: 'ISUP-HolgerHansPeterFreyther.1';
			package: #M2UA with: 'M2UA-HolgerHansPeterFreyther.1';
			package: #M3UA with: 'M3UA-HolgerHansPeterFreyther.1';
			package: #IPA with: 'IPA-HolgerHansPeterFreyther.1';
			package: #OsmoSocket with: 'OsmoSocket-HolgerHansPeterFreyther.20';
			package: #SCTP with: 'SCTP-HolgerHansPeterFreyther.1';
			package: #'MTP3-Codec' with: 'MTP3-Codec-HolgerHansPeterFreyther.1';
			package: #'MTP3-LinkHandling' with: 'MTP3-LinkHandling-HolgerHansPeterFreyther.16';
			package: #'NS-Core' with: 'NS-Core-HolgerHansPeterFreyther.20'. ].

]

{ #category : #versions }
ConfigurationOfOsmoNetwork >> version4: spec [
	<version: '4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 4'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '10/20/2016 23:31'.
		spec 
			project: 'OsmoCore' with: '2';
			project: 'OsmoLogging' with: '2';
			project: 'PetitParser' with: '1.14'.
		spec 
			package: #OsmoNetworkPrimitives with: 'OsmoNetworkPrimitives-HolgerHansPeterFreyther.7';
			package: #SCCP with: 'SCCP-HolgerHansPeterFreyther.4';
			package: #OpenBSCControl with: 'OpenBSCControl-HolgerHansPeterFreyther.1';
			package: #OsmoTLV with: 'OsmoTLV-HolgerHansPeterFreyther.3';
			package: #ISUP with: 'ISUP-HolgerHansPeterFreyther.1';
			package: #M2UA with: 'M2UA-HolgerHansPeterFreyther.1';
			package: #M3UA with: 'M3UA-HolgerHansPeterFreyther.1';
			package: #IPA with: 'IPA-HolgerHansPeterFreyther.1';
			package: #OsmoSocket with: 'OsmoSocket-HolgerHansPeterFreyther.20';
			package: #SCTP with: 'SCTP-HolgerHansPeterFreyther.1';
			package: #'MTP3-Codec' with: 'MTP3-Codec-HolgerHansPeterFreyther.1';
			package: #'MTP3-LinkHandling' with: 'MTP3-LinkHandling-HolgerHansPeterFreyther.16';
			package: #'NS-Core' with: 'NS-Core-HolgerHansPeterFreyther.20'. ].

]

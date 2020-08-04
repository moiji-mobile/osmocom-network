Class {
	#name : #BaselineOfOsmoNetwork,
	#superclass : #BaselineOf,
	#category : #BaselineOfOsmoNetwork
}

{ #category : #baselines }
BaselineOfOsmoNetwork >> baseline: spec [
	<baseline>
	

	spec baseline: 'OsmoLogging' with: [
		spec
			repository: 'github://moiji-mobile/osmocom-logging:v7/source'].
	spec baseline: 'OsmoCore' with: [
		spec
			repository: 'github://moiji-mobile/osmocom-core:v8/source'].
	spec baseline: 'PetitParser' with: [
		spec
			repository: 'github://moosetechnology/PetitParser:v2.2.0/src';
			loads: #( 'Core' ) ].

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
			group: 'all' with: #('default' 'isup' 'm2ua' 'm3ua' 'control' ).
]

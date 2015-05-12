Class {
	#name : #M2UAExamples,
	#superclass : #Object,
	#category : #M2UA
}

{ #category : #'as yet unclassified' }
M2UAExamples >> createAsp [
	"Create a SCTP network service"

	| service asp manager link linkSet |
	service := (SCTPNetworkService new)
		    hostname: 'localhost';
		    port: 2904;
		    yourself.
	"Create the ASP"
	asp := M2UAApplicationServerProcess initWith: service.

	"Create a Layer Management (LM) and start it"
	manager := (M2UALayerManagement new)
		    applicationServerProcess: asp;
		    targetState: M2UAAspStateActive;
		    yourself.
	asp mtpLevel3Boundary
		management: manager.
	
	link := MTPLevel3Link new
			mtpLevel3Boundary: asp mtpLevel3Boundary;
			yourself.
	linkSet := MTPLevel3Linkset new
			opc: 2000;
			dpc: 11;
			yourself.
	linkSet addLink: link.
	linkSet inspect.
	^link
]

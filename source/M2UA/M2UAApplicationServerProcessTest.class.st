"
A M2UAApplicationServerProcessTest is a test class for testing the behavior of M2UAApplicationServerProcess
"
Class {
	#name : #M2UAApplicationServerProcessTest,
	#superclass : #TestCase,
	#category : #'M2UA-Tests'
}

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessTest >> testCreation [
	| asp |
	asp := (M2UAApplicationServerProcess new)
		    onAspActive: [];
		    onAspDown: [];
		    onAspInactive: [];
		    onAspUp: [];
		    onStateChange: [];
		    onError: [:msg | ];
		    onNotify: [:type :ident | ];
		    onSctpEstablished: [];
		    onSctpReleased: [];
		    onSctpRestarted: [];
		    onSctpStatus: [];
		    yourself

]

{ #category : #'as yet unclassified' }
M2UAApplicationServerProcessTest >> testStateTransitions [
	| mock as asp |
	mock := SCTPNetworkServiceMock new.
	as := (M2UAASMock new)
		    socketService: mock;
		    yourself.
	asp := M2UAApplicationServerProcess initWith: mock.
	mock
	    applicationServer: as;
	    applicationServerProcess: asp.

	"This works as the mock will handle this synchronously"
	self assert: asp state = M2UAAspStateDown.
	asp
	    sctpEstablish;
	    aspUp.
	self assert: asp state = M2UAAspStateInactive.

	"Now bring it down and up again"
	asp aspDown.
	self assert: asp state = M2UAAspStateDown.
	asp
	    aspUp;
	    aspActive.
	self assert: asp state = M2UAAspStateActive.
	asp aspDown.
	self assert: asp state = M2UAAspStateDown.
	asp
	    aspUp;
	    aspActive;
	    aspInactive.
	self assert: asp state = M2UAAspStateInactive.
	asp sctpRelease.
	self assert: asp state = M2UAAspStateDown

]

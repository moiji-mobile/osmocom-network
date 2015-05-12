"
I am taking the LayerManagement control for an M2UAApplicationServiceProcess.

Currently you can tell me the ASP state this class should be in
and I will react to to the events from the ASP.
"
Class {
	#name : #M2UALayerManagement,
	#superclass : #Object,
	#instVars : [
		'targetState',
		'managedProcess'
	],
	#category : #'OsmoNetwork-M2UA'
}

{ #category : #accessing }
M2UALayerManagement >> applicationServerProcess [
	^managedProcess

]

{ #category : #creation }
M2UALayerManagement >> applicationServerProcess: aProcess [
	managedProcess := aProcess.
	managedProcess
	    onSctpEstablished: [self sctpEstablished];
	    onSctpRestarted: [self sctpEstablished];
	    onError: [:msg | self m2uaError: msg];
	    onNotify: [:type :ident | self m2uaNotify: type ident: ident];
	    onAspActive: [self m2uaActive];
	    onAspInactive: [self m2uaInactive];
	    onAspDown: [self m2uaDown];
	    onAspUp: [self m2uaUp]

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaActive [
	"E.g if the target state is already reached"
	managedProcess state = targetState ifTrue: [^self targetReached].
	targetState = M2UAAspStateInactive 
	    ifTrue: [managedProcess aspInactive]
	    ifFalse: [managedProcess aspDown]

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaDown [
	"E.g if the target state is already reached"
	managedProcess state = targetState ifTrue: [^self targetReached].

	"There is only one way forward"
	managedProcess aspUp

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaError: aMsg [
	self logNotice: 'M2UA Error.' area: #m2ua

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaInactive [
	"E.g if the target state is already reached"
	managedProcess state = targetState ifTrue: [^self targetReached].
	targetState = M2UAAspStateActive 
	    ifTrue: [managedProcess aspActive]
	    ifFalse: [managedProcess aspDown]

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaNotify: type ident: ident [
	"TODO: Check the type/ident"

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> m2uaUp [
	"E.g if the target state is already reached"
	managedProcess state = targetState ifTrue: [^self targetReached].
	targetState = M2UAAspStateActive 
	    ifTrue: [managedProcess aspActive]
	    ifFalse: [managedProcess aspInactive]

]

{ #category : #creation }
M2UALayerManagement >> manage [
	"I begin to manage the process."
	managedProcess
	    sctpRelease;
	    sctpEstablish

]

{ #category : #creation }
M2UALayerManagement >> releaseAll [
	"I begin to manage the process."
	managedProcess
	    sctpRelease

]

{ #category : #'as-process-callbacks' }
M2UALayerManagement >> sctpEstablished [
	"E.g if the target state is already reached"
	managedProcess state = targetState ifTrue: [^self].
	"There is only one way forward"
	managedProcess aspUp

]

{ #category : #'as yet unclassified' }
M2UALayerManagement >> targetReached [

]

{ #category : #creation }
M2UALayerManagement >> targetState: aState [
	"Use the M2UAAspState subclasses for the states"
	targetState := aState

]

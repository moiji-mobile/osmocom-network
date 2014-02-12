"
This is a monster.


Q.704 16.6

a) transfer prohibited control (RTPC) is shown in Figure 44;
b) transfer allowed control (RTAC) is shown in Figure 45;
c) transfer restricted control (RTRC) is shown in Figure 46c;
d) transfer controlled control (RTCC) is shown in Figure 46a;
e) signalling route set test control (RSRT) is shown in Figure 46;
f) signalling-route-set-congestion-test control (RCAT) is shown in Figure 46b.

"
Class {
	#name : #MTP3SignallingRouteManagement,
	#superclass : #MTP3HandlingBase,
	#category : #'MTP3-LinkHandling'
}

{ #category : #'Q.704' }
MTP3SignallingRouteManagement >> signallingRouteManagement: aMsg link: aLink [
	"Sent from HMDT"
	mtp3Service discardMessage: aMsg
]

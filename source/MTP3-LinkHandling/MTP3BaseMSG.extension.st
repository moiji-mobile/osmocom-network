Extension { #name : #MTP3BaseMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3BaseMSG >> dispatchForMessageDistributionDuringRestart: aLink [
	"As of Sheet 3/3 in Figure 25"
	aLink linkSet mtp3Service discardMessage: self.
]

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3BaseMSG >> dispatchForMessageDistributionOn: aLink [
	self notYetImplemented
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3BaseMSG >> dispatchForSignallingRouteManagement: aHMRT [
	aHMRT discardMessage: self.
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3BaseMSG >> dispatchForSignallingRouteManagementDuringRestart: aHMRT [
	aHMRT discardMessage: self.
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3BaseMSG >> dispatchForSignallingTrafficManagement: aHMRT [
      aHMRT discardMessage: self
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3BaseMSG >> dispatchForSignallingTrafficManagementDuringRestart: aHMRT [
	aHMRT discardMessage: self.
	
]

Extension { #name : #MTP3TRAMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3TRAMSG >> dispatchForMessageDistributionDuringRestart: aLink [
	aLink linkSet mtp3Service stm discardMessage: self.
]

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3TRAMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service stm signallingTrafficManagement: self link: aLink
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3TRAMSG >> dispatchForSignallingTrafficManagement: aHMRT [
      aHMRT selectDirectLinkAndSend: self.
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3TRAMSG >> dispatchForSignallingTrafficManagementDuringRestart: aHMRT [
	aHMRT routeMessageDuringRestart: self.
]

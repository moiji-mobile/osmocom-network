Extension { #name : #MTP3TFMMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3TFMMSG >> dispatchForMessageDistributionDuringRestart: aLink [
	aLink linkSet mtp3Service srm signallingRouteManagement: self link: aLink
]

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3TFMMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service srm signallingRouteManagement: self link: aLink
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3TFMMSG >> dispatchForSignallingRouteManagement: aHMRT [
	aHMRT congestionControl: self.
]

{ #category : #'*MTP3-LinkHandling-HMRT' }
MTP3TFMMSG >> dispatchForSignallingRouteManagementDuringRestart: aHMRT [
	aHMRT routeMessageDuringRestart: self
]

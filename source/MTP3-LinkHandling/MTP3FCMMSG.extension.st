Extension { #name : #MTP3FCMMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3FCMMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service srm signallingRouteManagement: self link: aLink
]

Extension { #name : #MTP3UFCMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3UFCMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service srm signallingRouteManagement: self link: aLink
]

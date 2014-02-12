Extension { #name : #MTP3DLMMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3DLMMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service slm signallingLinkManagement: self link: aLink
]

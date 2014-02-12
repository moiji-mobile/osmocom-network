Extension { #name : #MTP3CHMMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3CHMMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service stm signallingTrafficManagement: self link: aLink
]

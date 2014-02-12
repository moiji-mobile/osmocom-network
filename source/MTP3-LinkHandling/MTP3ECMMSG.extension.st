Extension { #name : #MTP3ECMMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3ECMMSG >> dispatchForMessageDistributionOn: aLink [
	aLink linkSet mtp3Service stm signallingTrafficManagement: self link: aLink
]

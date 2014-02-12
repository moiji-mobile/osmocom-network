Extension { #name : #MTP3LinkTestMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3LinkTestMSG >> dispatchForMessageDistributionDuringRestart: aLink [
	aLink linkSet mtp3Service sltc signallingLinkTestControl: self link: aLink.
]

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3LinkTestMSG >> dispatchForMessageDistributionOn: aLink [
	aLink sltc signallingLinkTestControl: self
]

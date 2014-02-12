Extension { #name : #MTP3DataMSG }

{ #category : #'*MTP3-LinkHandling-HMDT' }
MTP3DataMSG >> dispatchForMessageDistributionOn: aLink [
	data isNil
		ifTrue: [
			aLink linkSet mtp3Service discardMessage: self.
			aLink linkSet mtp3Service hmrt sendUserPartUnavailable: self link: aLink.
		]
		ifFalse: [aLink linkSet signalData: self].
]

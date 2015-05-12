"
I test some parts of the grammar
"
Class {
	#name : #CtrlParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'OsmoNetwork-Control-Tests'
}

{ #category : #accessing }
CtrlParserTest class >> packageNamesUnderTest [
	^#('CtrlParser')

]

{ #category : #accessing }
CtrlParserTest >> parserClass [
	^CtrlParser

]

{ #category : #accessing }
CtrlParserTest >> testCallStat [
	| data res |
	data := 'TRAP 0 net.1.bsc.7.call_stats.v2 mg_ip_addr=213.167.134.139,mg_port=60480,endpoint_ip_addr=127.0.0.1,endpoint_port=33342,nat_pkt_in=208,nat_pkt_out=0,nat_bytes_in=6055,nat_bytes_out=0,nat_jitter=145,nat_pkt_loss=-1,bsc_pkt_in=0,bsc_pkt_out=208,bsc_bytes_in=0,bsc_bytes_out=6055,bsc_jitter=0,bsc_pkt_loss=0,sccp_src_ref=100,sccp_dst_ref=1000'.
	res := self parse: data.
	self
	    assert: (res at: 'nat_id') = '1';
	    assert: (res at: 'bsc_id') = '7';
	    assert: (res at: 'mg_ip_addr') = '213.167.134.139';
	    assert: (res at: 'mg_port') = '60480';
	    assert: (res at: 'endpoint_ip_addr') = '127.0.0.1';
	    assert: (res at: 'endpoint_port') = '33342';
	    assert: (res at: 'nat_pkt_in') = '208';
	    assert: (res at: 'nat_pkt_out') = '0';
	    assert: (res at: 'nat_bytes_in') = '6055';
	    assert: (res at: 'nat_bytes_out') = '0';
	    assert: (res at: 'nat_jitter') = '145';
	    assert: (res at: 'nat_pkt_loss') = '-1';
	    assert: (res at: 'bsc_pkt_in') = '0';
	    assert: (res at: 'bsc_pkt_out') = '208';
	    assert: (res at: 'bsc_bytes_in') = '0';
	    assert: (res at: 'bsc_bytes_out') = '6055';
	    assert: (res at: 'bsc_jitter') = '0';
	    assert: (res at: 'bsc_pkt_loss') = '0';
	    assert: (res at: 'sccp_src_ref') = '100';
	    assert: (res at: 'sccp_dst_ref') = '1000'

]

{ #category : #'as yet unclassified' }
CtrlParserTest >> testCallStatIsFor [
	| data |
	data := #(#('net' $.) #('1' $.) #('bsc' $.) #('7' $.) #('call_stats' $.) #('v2' nil)).
	self assert: (CtrlCallStatTrap isFor: data)

]

{ #category : #accessing }
CtrlParserTest >> testLocationStateTrap [
	| data res |
	data := 'TRAP 0 net.1.bsc.7.bts.6.location-state 1,fix2d,1.000000,2.000000,3.000000,inoperational,unlocked,on'.
	res := self parse: data.
	self assert: res net = 1.
	self assert: res bsc = 7.
	self assert: res bts = 6.
	self assert: res locTimeStamp = 1 asString.
	self assert: res locLat = '1.000000'.
	self assert: res locLon = '2.000000'.
	self assert: res locHeight = '3.000000'.
	self assert: res rfPolicyOn.
	self deny: res trxAvailable.
	self deny: res trxAdminLock

]

{ #category : #'as yet unclassified' }
CtrlParserTest >> testResponseeError [
	| data res |
	data := 'ERROR 386 Command not found'.
	res := self parse: data.
	self assert: res msg = data

]

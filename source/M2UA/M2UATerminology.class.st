"
I attempt to help with the terminology for M2UA.

M2UA is defined in IETF RFC 3331 and is actually from a family
of closely related RFCs for M3UA, SUA, M2PA.

The whole idea is that one can adapt the M2UA layer from the classlic
E1/T1 timeslots to the more modern SCTP (SIGTRAN). MTP3 and above will
not notice the difference.

The communication for M2UA is between two systems, both should be
configurable as either a client or server (listening for incoming SCTP
connections).

In general the communication is between a Signalling Gateway
(SG) and a Media Gateway Controller (MGC). In our world the MGC
would is the MSC/HLR/VLR/AuC.

What makes things complicated is the cardinality of systems. There is
an Application Server (AS), this can have multiple Application Server
Processes (ASP) for one or multiple MTP links. While the RFC onlys
says that the SG should the list of ASs in practice both ends need to
do it.
"
Class {
	#name : #M2UATerminology,
	#superclass : #Object,
	#category : #M2UA
}

"
I am a M3UA Application Server Process.

I have an internal state machine and a state and will be used by the
M3UA Layer. I am written for the usage in a Media Gateway Controller
and will also keep information about the Application Server itself.

If I need to be used on a Signalling Gateway (SG) I will need a dedicated
M3UA Application Server class and state machine.

I can currently only manage a single interface. The specification allows
a single ASP to send one ASPActive for one interface at a time.
"
Class {
	#name : #M3UAApplicationServerProcess,
	#superclass : #Object,
	#category : #'OsmoNetwork-M3UA'
}

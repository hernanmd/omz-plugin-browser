Class {
	#name : 'OMZPluginAbstractObject',
	#superclass : 'Object',
	#category : 'OMZPluginBrowser',
	#package : 'OMZPluginBrowser'
}

{ #category : 'private' }
OMZPluginAbstractObject >> newZshCommand: aZshCommandString [
	" Answer a <String> which is the command to execute in the context of a new Z Shell"

	^ String streamContents: [ : stream |
		stream
			<< 'zsh -ic ';
			<< aZshCommandString ]
]

Class {
	#name : 'OMZPluginAbstractObject',
	#superclass : 'Object',
	#category : 'OMZPluginBrowser-Core',
	#package : 'OMZPluginBrowser',
	#tag : 'Core'
}

{ #category : 'private' }
OMZPluginAbstractObject >> newZshCommand: aZshCommandString [
	" Answer a <String> which is the command to execute in the context of a new Z Shell"

	^ String streamContents: [ : stream |
		stream
			<< 'zsh -ic ';
			<< aZshCommandString ]
]

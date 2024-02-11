Class {
	#name : 'OMZPluginObject',
	#superclass : 'OMZPluginAbstractObject',
	#instVars : [
		'pluginName',
		'pluginInfo'
	],
	#category : 'OMZPluginBrowser-Core',
	#package : 'OMZPluginBrowser',
	#tag : 'Core'
}

{ #category : 'instance creation' }
OMZPluginObject class >> named: aString [
	"Answer a new instance of the receiver named aString"
	
	^ self new
		pluginName: aString;
		yourself.
]

{ #category : 'accessing' }
OMZPluginObject >> disable [
	"Disable the receiver in the host system"
	
	LibC resultOfCommand: self disableCommand
]

{ #category : 'accessing - commands' }
OMZPluginObject >> disableCommand [
	"Answer a <String> with the command used to disable the receiver"

	^ self newZshCommand: '"omz plugin disable '
]

{ #category : 'accessing' }
OMZPluginObject >> enable [
	"Do enable the receiver in the host system"
	
	^ LibC resultOfCommand: self enableCommand
]

{ #category : 'accessing - commands' }
OMZPluginObject >> enableCommand [
	"Answer a <String> with the command used to enable the receiver"
	
	^ self newZshCommand: '"omz plugin enable '
]

{ #category : 'accessing' }
OMZPluginObject >> getInfo [
	"Get information of the receiver in the host system"
	
	^ LibC resultOfCommand: self infoCommand.
	
]

{ #category : 'accessing - commands' }
OMZPluginObject >> infoCommand [
	"Answer a <String> with the command used to get infrormation of the receiver"
	
	^ self newZshCommand: '"omz plugin info '
]

{ #category : 'accessing' }
OMZPluginObject >> load [
	"Load the receiver in the host system"
	
	LibC resultOfCommand: self loadCommand
]

{ #category : 'accessing - commands' }
OMZPluginObject >> loadCommand [
	"Answer a <String> with the command used to load the receiver"

	^ self newZshCommand: '"omz plugin load '
]

{ #category : 'private' }
OMZPluginObject >> newZshCommand: aZshCommandString [
	" Answer a <String> which is the command to execute in the context of a new Z Shell"

	^ String streamContents: [ : stream |
		stream
			<< 'zsh -ic ';
			<< aZshCommandString;
			<< self pluginName;
			<< '"' ]
]

{ #category : 'accessing' }
OMZPluginObject >> pluginInfo [

	^ pluginInfo
		ifNil: [ pluginInfo := self getInfo ]
]

{ #category : 'accessing' }
OMZPluginObject >> pluginInfo: anObject [

	pluginInfo := anObject
]

{ #category : 'accessing' }
OMZPluginObject >> pluginName [

	^ pluginName
]

{ #category : 'accessing' }
OMZPluginObject >> pluginName: anObject [

	pluginName := anObject
]

{ #category : 'printing' }
OMZPluginObject >> printOn: aStream [
	"Private - See superimplementor's comment"

	super printOn: aStream.
	aStream
		<< ' [';
		<< self pluginName;
		<< ']'.
	
]

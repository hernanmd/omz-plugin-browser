"
An Oh-My-Zsh plugin is a modular extension for the Oh-My-Zsh framework, enhancing its functionality with custom commands, aliases, themes, and additional features to personalize and streamline the Zsh shell experience.

A plugin in Oh-My-Zsh can implement actions such as initialization, command interception, environment setup, configuration parsing, and shell event handling.

A plugin object can be enabled or disabled, and it can provide textual information about it.
"
Class {
	#name : 'OMZPluginObject',
	#superclass : 'OMZPluginAbstractObject',
	#instVars : [
		'pluginName',
		'pluginInfo',
		'enabled'
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

{ #category : 'instance creation' }
OMZPluginObject class >> named: aString enabled: aBoolean [
	"Answer a new instance of the receiver named aString"
	
	^ self new
		pluginName: aString;
		enabled: aBoolean;
		yourself.
]

{ #category : 'comparing' }
OMZPluginObject >> = anOMZPluginObject [
	"Answer <true> if receiver is the same as anOMZPluginObject"
	
	self == anOMZPluginObject
		ifTrue: [ ^ true ].
	self class = anOMZPluginObject class
		ifFalse: [ ^ false ].
	^ self pluginName = anOMZPluginObject pluginName
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
OMZPluginObject >> enabled: anObject [

	enabled := anObject
]

{ #category : 'accessing' }
OMZPluginObject >> getInfo [
	"Get information of the receiver in the host system"
	
	^ LibC resultOfCommand: self infoCommand.
	
]

{ #category : 'comparing' }
OMZPluginObject >> hash [
	
	^ self pluginName hash
]

{ #category : 'accessing - commands' }
OMZPluginObject >> infoCommand [
	"Answer a <String> with the command used to get infrormation of the receiver"
	
	^ self newZshCommand: '"omz plugin info '
]

{ #category : 'testing' }
OMZPluginObject >> isEnabled [
	"Answer <true> if receiver is enabled in the host system"
	
	^ enabled
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

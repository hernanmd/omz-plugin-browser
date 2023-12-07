Class {
	#name : 'OMZPluginBrowserObject',
	#superclass : 'Object',
	#category : 'OMZPluginBrowser',
	#package : 'OMZPluginBrowser'
}

{ #category : 'accessing' }
OMZPluginBrowserObject >> disablePlugin: aPluginName [

	^ LibC resultOfCommand: (self pluginDisableCommand: aPluginName)
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> enablePlugin: aPluginName [

	^ LibC resultOfCommand: (self pluginEnableCommand: aPluginName)
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> listPlugins [
	"Answer a <Collection> of <Association> each one the name of an installed plugin"
	
	| collectedPlugins |
	
	collectedPlugins := OrderedCollection new: 500.
	(LibC resultOfCommand: self listPluginsCommand) lines
			do: [ : entry | collectedPlugins add: entry -> (LibC resultOfCommand: (self pluginInfoCommand: entry)) ]
			displayingProgress: 'Collecting plugins...'.
	^ collectedPlugins
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> listPluginsCommand [

	^ self newZshCommand: '"omz plugin list"'
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> loadPlugin: aPluginName [

	^ LibC resultOfCommand: (self pluginLoadCommand: aPluginName)
]

{ #category : 'private' }
OMZPluginBrowserObject >> newZshCommand: aZshCommandString [
	" Answer a <String> which is the command to execute in the context of a new Z Shell"

	^ String streamContents: [ : stream |
		stream
			<< 'zsh -ic';
			<< aZshCommandString ]
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> pluginDisableCommand: aPluginName [

	^ self newZshCommand: '"omz plugin disable "' , aPluginName
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> pluginEnableCommand: aPluginName [

	^ self newZshCommand: '"omz plugin enable "' , aPluginName
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> pluginInfoCommand: aPluginName [

	^ self newZshCommand: '"omz plugin info "' , aPluginName
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> pluginLoadCommand: aPluginName [

	^ self newZshCommand: '"omz plugin load "' , aPluginName
]

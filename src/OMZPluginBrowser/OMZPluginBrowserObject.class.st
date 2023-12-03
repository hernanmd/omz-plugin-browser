Class {
	#name : 'OMZPluginBrowserObject',
	#superclass : 'Object',
	#category : 'OMZPluginBrowser',
	#package : 'OMZPluginBrowser'
}

{ #category : 'accessing' }
OMZPluginBrowserObject >> list [
	"Answer a <Collection> of <String> each one the name of an installed plugin"
	
	^ (LibC resultOfCommand: self listPluginsCommand) lines
			collect: [ : entry | 
				entry -> (LibC resultOfCommand: (self pluginInfoCommand: entry)) ]
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> listPluginsCommand [

	^ 'zsh -ic "omz plugin list"'
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> pluginInfoCommand: aPluginName [

	^ 'zsh -ic "omz plugin info "' , aPluginName
]

"
## Examples

```smalltalk
| pluginBrowser |

pluginBrowser := OMZPluginBrowserObject new.
"" Get a list of the plugin names ""
pluginBrowser listPluginNames.
``` 
"
Class {
	#name : 'OMZPluginBrowserObject',
	#superclass : 'OMZPluginAbstractObject',
	#instVars : [
		'plugins'
	],
	#category : 'OMZPluginBrowser',
	#package : 'OMZPluginBrowser'
}

{ #category : 'accessing' }
OMZPluginBrowserObject >> addPluginNamed: pluginName [

	self plugins add: (self newPluginNamed: pluginName)
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> collectPlugins [
	"Answer a <Collection> of <OMZPluginObject> representing installed plugins in the host system"
	
	plugins := OrderedCollection new: 500.
	self listPluginNames
		do: [ : pluginName | self addPluginNamed: pluginName ]
		displayingProgress: 'Collecting plugins...'.
	^ plugins
]

{ #category : 'accessing - operations' }
OMZPluginBrowserObject >> disablePlugin: aPluginName [

	^ (self pluginNamed: aPluginName) disable
]

{ #category : 'accessing - operations' }
OMZPluginBrowserObject >> enablePlugin: aPluginName [

	^ (self pluginNamed: aPluginName) enable
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> listPluginNames [
	"Answer a <Collection> of <String> representing the available plugins in the host system"
	
	^ (LibC resultOfCommand: self listPluginsCommand) lines
]

{ #category : 'accessing - commands' }
OMZPluginBrowserObject >> listPluginsCommand [

	^ self newZshCommand: '"omz plugin list"'
]

{ #category : 'accessing - operations' }
OMZPluginBrowserObject >> loadPlugin: aPluginName [
	"Load aPluginName in the host system"

	^ (self pluginNamed: aPluginName) load
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> newPluginNamed: pluginName [

	^ OMZPluginObject named: pluginName
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> pluginNamed: aPluginName [

	^ self plugins at: aPluginName
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> plugins [

	^ plugins
		ifNil: [ self collectPlugins ]
]

{ #category : 'accessing' }
OMZPluginBrowserObject >> plugins: anObject [

	plugins := anObject
]

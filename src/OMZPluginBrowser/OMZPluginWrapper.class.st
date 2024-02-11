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
	#name : 'OMZPluginWrapper',
	#superclass : 'OMZPluginAbstractObject',
	#instVars : [
		'plugins',
		'enabledPlugins'
	],
	#category : 'OMZPluginBrowser-Core',
	#package : 'OMZPluginBrowser',
	#tag : 'Core'
}

{ #category : 'accessing' }
OMZPluginWrapper >> addPluginNamed: pluginName [

	self plugins add: (self newPluginNamed: pluginName)
]

{ #category : 'accessing' }
OMZPluginWrapper >> collectPlugins [
	"Answer a <Collection> of <OMZPluginObject> representing installed plugins in the host system"
	
	plugins := OrderedCollection new: 500.
	self pluginNames
		do: [ : pluginName | self addPluginNamed: pluginName ]
		displayingProgress: 'Collecting plugins...'.
	^ plugins
]

{ #category : 'accessing - operations' }
OMZPluginWrapper >> disablePlugin: aPluginName [

	^ (self pluginNamed: aPluginName) disable
]

{ #category : 'accessing - operations' }
OMZPluginWrapper >> enablePlugin: aPluginName [

	^ (self pluginNamed: aPluginName) enable
]

{ #category : 'accessing - commands' }
OMZPluginWrapper >> isEnabled: aPluginName [

	^ self listEnabledPlugins includes: aPluginName
]

{ #category : 'accessing' }
OMZPluginWrapper >> listEnabledPlugins [

	^ enabledPlugins 
		ifNil: [ enabledPlugins := LibC resultOfCommand: self listEnabledPluginsCommand ]
]

{ #category : 'accessing - commands' }
OMZPluginWrapper >> listEnabledPluginsCommand [

	^ 'zsh -c "echo $plugins"'

]

{ #category : 'accessing - commands' }
OMZPluginWrapper >> listInstalledPluginsCommand [

	^ self newZshCommand: '"omz plugin list"'
]

{ #category : 'accessing - operations' }
OMZPluginWrapper >> loadPlugin: aPluginName [
	"Load aPluginName in the host system"

	^ (self pluginNamed: aPluginName) load
]

{ #category : 'accessing' }
OMZPluginWrapper >> newPluginNamed: pluginName [

	^ OMZPluginObject 
		named: pluginName
		enabled: (self isEnabled: pluginName).
]

{ #category : 'accessing' }
OMZPluginWrapper >> pluginNamed: aPluginName [

	^ self plugins at: aPluginName
]

{ #category : 'accessing' }
OMZPluginWrapper >> pluginNames [
	"Answer a <Collection> of <String> representing the available plugins in the host system"
	
	^ (LibC resultOfCommand: self listInstalledPluginsCommand) lines
]

{ #category : 'accessing' }
OMZPluginWrapper >> plugins [

	^ plugins
		ifNil: [ self collectPlugins ]
]

{ #category : 'accessing' }
OMZPluginWrapper >> plugins: anObject [

	plugins := anObject
]

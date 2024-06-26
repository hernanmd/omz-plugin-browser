"
The OMZ Plugin toolbar offers a search bar to filter the list of presented plugins. It acts on each keypress updating the list contents. The current search strategy is to match the beggining of the plugin name.
"
Class {
	#name : 'OMZSpToolbarPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'omzSearchPluginTextPresenter',
		'omzSearchPluginButtonPresenter',
		'model'
	],
	#category : 'OMZPluginBrowser-Spec-UI',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'UI'
}

{ #category : 'layout' }
OMZSpToolbarPresenter >> defaultLayout [ 

	^ SpBoxLayout newLeftToRight 
		add: omzSearchPluginTextPresenter;
		add: omzSearchPluginButtonPresenter expand: false;
		yourself
]

{ #category : 'accessing - search' }
OMZSpToolbarPresenter >> filteredPluginsFor: aString [ 
	"Answer a <Collection> of plugin names matching aString"
	
	^ self plugins select: [ : plugin |
		plugin pluginName beginsWith: aString ]
]

{ #category : 'initialization' }
OMZSpToolbarPresenter >> initializePresenters [ 

	omzSearchPluginTextPresenter := self newTextInput
		help: 'Search an OMZ plugin by just typing a name';
		placeholder: 'Type plugin name to search';
		whenTextChangedDo: [ self updatePluginsList ];
		yourself.
	omzSearchPluginButtonPresenter := self newButton
		icon: (self iconNamed: #smallFind);
		action: [ self updatePluginsList ];		
		help: 'Search plugins';
		yourself
]

{ #category : 'accessing' }
OMZSpToolbarPresenter >> model [

	^ model
]

{ #category : 'accessing - search' }
OMZSpToolbarPresenter >> plugins [
	"Answer a <Collection> of <OMZPluginObject> representing OMZ plugins in the host system"

	^ self model plugins
]

{ #category : 'initialization' }
OMZSpToolbarPresenter >> pluginsList [

	^ self owner omzPluginListPresenter
]

{ #category : 'callbacks' }
OMZSpToolbarPresenter >> searchList: aString [

	self shouldBeImplemented
]

{ #category : 'accessing - model' }
OMZSpToolbarPresenter >> setModelBeforeInitialization: anOMZPluginWrapper [

	model := anOMZPluginWrapper
]

{ #category : 'initialization' }
OMZSpToolbarPresenter >> updatePluginsList [

	self pluginsList items:  (omzSearchPluginTextPresenter text
		ifEmpty: [ self plugins ]
		ifNotEmpty: [ :pattern | self filteredPluginsFor: pattern ])

]

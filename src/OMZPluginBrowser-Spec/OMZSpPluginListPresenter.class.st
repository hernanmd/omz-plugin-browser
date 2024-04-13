"
This presenter provides a table with two columns to be populated by the available plugins in the host system.

The first column contains the plugin name, and the second column its enabled/disabled status.

"
Class {
	#name : 'OMZSpPluginListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'omzPluginListPresenter',
		'model'
	],
	#category : 'OMZPluginBrowser-Spec-UI',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'UI'
}

{ #category : 'commands' }
OMZSpPluginListPresenter class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildOMZPluginListContextualGroupWith: presenterInstance)
]

{ #category : 'commands' }
OMZSpPluginListPresenter class >> buildOMZListOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'OMZListMenu') asSpecGroup
			register: ((OMZSpEnableCommand
			forSpecWithIconNamed: #glamorousAdd
			shortcutKey: 'A' asShortcut) 
				context: presenterInstance);
			register: ((OMZSpDisableCommand
			forSpecWithIconNamed: #glamorousRemove
			shortcutKey: 'D' asShortcut) 
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : 'commands' }
OMZSpPluginListPresenter class >> buildOMZPluginListContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'OMZSelContextualMenu') asSpecGroup
		register: (self buildOMZListOperationsGroupWith: presenterInstance);		
		yourself

]

{ #category : 'layout' }
OMZSpPluginListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		add: omzPluginListPresenter;
		yourself.
]

{ #category : 'transmission' }
OMZSpPluginListPresenter >> defaultOutputPort [ 

	^ omzPluginListPresenter defaultOutputPort
]

{ #category : 'initialization' }
OMZSpPluginListPresenter >> initializePresenters [

	omzPluginListPresenter := self newTable
		addColumn: (SpStringTableColumn new
			title: 'Name';
			width: 300;			
			sortFunction: #yourself ascending;			
			evaluated: [ : each | each pluginName ];
			yourself);
		addColumn: (SpCheckBoxTableColumn new
			width: 20;
			title: 'Enabled';
			evaluated: [ : each | each isEnabled ];
			yourself);
		items: model;
		contextMenu: [ (self rootCommandsGroup / 'OMZSelContextualMenu') beRoot asMenuPresenter ];
		yourself
]

{ #category : 'api' }
OMZSpPluginListPresenter >> items: aCollection [
	"Shortcut method to set the receiver's plugins to aCollection"

	omzPluginListPresenter items: aCollection
]

{ #category : 'accessing' }
OMZSpPluginListPresenter >> selectedItem [
	"Shortcut to answer the current selected <OMZPluginObject>"
	
	^ omzPluginListPresenter selectedItem
]

{ #category : 'accessing - model' }
OMZSpPluginListPresenter >> setModelBeforeInitialization: aPluginCollection [

	model := aPluginCollection
]

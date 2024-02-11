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
			title: 'Title';
			sortFunction: #yourself ascending;			
			evaluated: [ : each | (each isKindOf: OMZPluginObject) 
					ifTrue: [ each pluginName ]
					ifFalse: [ 'self halt' ] ];
			yourself);
		items: model;
		contextMenu: [ (self rootCommandsGroup / 'OMZSelContextualMenu') beRoot asMenuPresenter ];	
		yourself
]

{ #category : 'api' }
OMZSpPluginListPresenter >> items: aCollection [

	omzPluginListPresenter items: aCollection
]

{ #category : 'accessing - model' }
OMZSpPluginListPresenter >> setModelBeforeInitialization: aPluginCollection [

	model := aPluginCollection
]

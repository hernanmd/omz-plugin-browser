Class {
	#name : 'OMZSpPluginBrowserMain',
	#superclass : 'SpPresenter',
	#instVars : [
		'omzToolbarPresenter',
		'omzPluginListPresenter',
		'omzPluginDescriptionPresenter',
		'statusBar'
	],
	#category : 'OMZPluginBrowser-Spec-UI',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'UI'
}

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> connectPresenters [ 

	omzPluginListPresenter
		transmitTo: omzPluginDescriptionPresenter 
		transform: [ : omzPlugin | 
			omzPlugin
				ifNil: [ String empty ]
				ifNotNil: [ omzPlugin pluginInfo ] ]
		postTransmission: [ : destination :origin :transmited |
			omzPluginDescriptionPresenter contents: transmited pluginInfo ]
]

{ #category : 'layout' }
OMZSpPluginBrowserMain >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: omzToolbarPresenter height: self toolbarHeight;
		add: (SpPanedLayout newTopToBottom
			positionOfSlider: 35 percent;
			add: omzPluginListPresenter;
			add: omzPluginDescriptionPresenter;
			yourself);
		add: statusBar height: self toolbarHeight;
		yourself.
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initialExtentForWindow [

	^ (900 @ 600) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initialTitle [

	^ 'OMZ Plugin Browser'

]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializePluginDescriptionPresenter [

	omzPluginDescriptionPresenter := self instantiate: OMZSpPluginDescriptionPresenter.
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializePluginsList [

	omzPluginListPresenter := self instantiate: OMZSpPluginListPresenter on: self plugins.
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializePluginsToolbar [
	"This is a search toolbar"
	
	omzToolbarPresenter := self instantiate: OMZSpToolbarPresenter on: self model.
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializePresenters [

	self 
		initializePluginsToolbar;
		initializePluginsList;
		initializePluginDescriptionPresenter;
		initializeStatusbar
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializeStatusbar [

	statusBar := SpStatusBarPresenter new
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	self setTitleTo: aSpWindowPresenter.
	self setWindowIconTo: aSpWindowPresenter.
	self setInitialExtentTo: aSpWindowPresenter.

	aSpWindowPresenter aboutText: 'Oh-My-Zsh plugin browser, version 1.0'
]

{ #category : 'accessing' }
OMZSpPluginBrowserMain >> model [
	"Answer the receiver's <OMZPluginWrapper>"

	^ self application pluginWrapper.
]

{ #category : 'accessing' }
OMZSpPluginBrowserMain >> omzPluginListPresenter [

	^ omzPluginListPresenter
]

{ #category : 'showing' }
OMZSpPluginBrowserMain >> open [ 

	super open.
	self centered
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> plugins [
	"Answer a <Collection> of <OMZPluginObject>"

	^ self application plugins
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> setInitialExtentTo: aSpWindowPresenter [
	
	aSpWindowPresenter initialExtent: self initialExtentForWindow
]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> setTitleTo: aSpWindowPresenter [

	aSpWindowPresenter title: self initialTitle

]

{ #category : 'initialization' }
OMZSpPluginBrowserMain >> setWindowIconTo: aSpWindowPresenter [

	aSpWindowPresenter	windowIcon: (self iconNamed: #page).
]

{ #category : 'TOREMOVE' }
OMZSpPluginBrowserMain >> toolbarHeight [

	^ self class toolbarHeight
]

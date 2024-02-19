"
The Spec application for the Oh-My-Zsh plugin browser.
"
Class {
	#name : 'OMZSpPluginBrowserApp',
	#superclass : 'SpApplication',
	#instVars : [
		'pluginWrapper'
	],
	#category : 'OMZPluginBrowser-Spec-UI',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'UI'
}

{ #category : 'private' }
OMZSpPluginBrowserApp class >> menuOMZPluginBrowserOn: aBuilder [
	<worldMenu>

	(aBuilder item: #OMZPluginBrowser)
		parent: #Tools;
		label: 'OMZ Plugin Browser';
		icon: (self iconNamed: #catalog);
		action: [ OMZSpPluginBrowserApp new run ];
		help: 'Oh My Zsh Plugin Browser Application';
		order: 635
]

{ #category : 'initialization' }
OMZSpPluginBrowserApp >> initialize [

	super initialize.
	self pluginWrapper: OMZPluginWrapper new.
]

{ #category : 'accessing' }
OMZSpPluginBrowserApp >> pluginWrapper [

	^ pluginWrapper
]

{ #category : 'accessing' }
OMZSpPluginBrowserApp >> pluginWrapper: anObject [

	pluginWrapper := anObject
]

{ #category : 'accessing' }
OMZSpPluginBrowserApp >> plugins [
	"Answer a <Collection> of <OMZPluginObject>"

	^ self pluginWrapper plugins
]

{ #category : 'running' }
OMZSpPluginBrowserApp >> start [
	" Private - See superimplementor's comment "

	(OMZSpPluginBrowserMain newApplication: self) open.
]

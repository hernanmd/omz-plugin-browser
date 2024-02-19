"
Implements the execution logic to request a plugin `OMZPluginObject` to be disabled.
"
Class {
	#name : 'OMZSpDisableCommand',
	#superclass : 'OMZSpAbstractCommand',
	#category : 'OMZPluginBrowser-Spec-Commands',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'Commands'
}

{ #category : 'default' }
OMZSpDisableCommand class >> defaultDescription [

	^ 'Disable the selected plugin'
]

{ #category : 'default' }
OMZSpDisableCommand class >> defaultIconName [

	^ #delete
]

{ #category : 'default' }
OMZSpDisableCommand class >> defaultName [

	^ 'Disable'
]

{ #category : 'executing' }
OMZSpDisableCommand >> execute [
	"Request a title to create a new note"

	| proceed |
	proceed := self application newConfirm
		title: 'Disable plugin';
		label: 'Confirm to disable the selected plugin?';
		acceptLabel: 'Confirm';
		cancelLabel: 'Cancel';		
		openModalWithParent: context window.
	
	proceed ifFalse: [ ^ self ].
	self selectedPlugin disable.
]

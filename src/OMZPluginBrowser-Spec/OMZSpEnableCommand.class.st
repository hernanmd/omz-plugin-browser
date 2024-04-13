"
Implements the execution logic to request a plugin `OMZPluginObject` to be enabled.
"
Class {
	#name : 'OMZSpEnableCommand',
	#superclass : 'OMZSpAbstractCommand',
	#category : 'OMZPluginBrowser-Spec-Commands',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'Commands'
}

{ #category : 'default' }
OMZSpEnableCommand class >> defaultDescription [

	^ 'Enable the selected plugin'
]

{ #category : 'default' }
OMZSpEnableCommand class >> defaultIconName [

	^ #add
]

{ #category : 'default' }
OMZSpEnableCommand class >> defaultName [

	^ 'Enable'
]

{ #category : 'testing' }
OMZSpEnableCommand >> canBeExecuted [ 

	^ self selectedPlugin isDisabled
]

{ #category : 'executing' }
OMZSpEnableCommand >> execute [
	"Request a title to create a new note"

	| proceed |
	proceed := self application newConfirm
		title: 'Enable plugin';
		label: 'Confirm to enable the selected plugin?';
		acceptLabel: 'Confirm';
		cancelLabel: 'Cancel';		
		openModalWithParent: context window.
	
	proceed ifFalse: [ ^ self ].
	self selectedPlugin enable.
]

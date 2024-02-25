Class {
	#name : 'OMZSpPluginDescriptionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'descriptionPresenter'
	],
	#category : 'OMZPluginBrowser-Spec-UI',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'UI'
}

{ #category : 'layout' }
OMZSpPluginDescriptionPresenter >> contents: aString [
	"Set the receiver's document content to be aString"

	self descriptionPresenter documentFromString: aString
]

{ #category : 'layout' }
OMZSpPluginDescriptionPresenter >> defaultInputPort [ 

	^ SpModelPort newPresenter: self
]

{ #category : 'layout' }
OMZSpPluginDescriptionPresenter >> defaultLayout [ 
	
	^ SpBoxLayout newTopToBottom 
		add: descriptionPresenter;
		yourself.
]

{ #category : 'accessing' }
OMZSpPluginDescriptionPresenter >> descriptionPresenter [

	^ descriptionPresenter
]

{ #category : 'accessing' }
OMZSpPluginDescriptionPresenter >> descriptionPresenter: anObject [

	descriptionPresenter := anObject
]

{ #category : 'initialization' }
OMZSpPluginDescriptionPresenter >> initializePresenters [

	descriptionPresenter := self instantiate: MicrodownPresenter.
]

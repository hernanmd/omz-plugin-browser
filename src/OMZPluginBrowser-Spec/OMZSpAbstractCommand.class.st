Class {
	#name : 'OMZSpAbstractCommand',
	#superclass : 'CmCommand',
	#category : 'OMZPluginBrowser-Spec-Commands',
	#package : 'OMZPluginBrowser-Spec',
	#tag : 'Commands'
}

{ #category : 'accessing' }
OMZSpAbstractCommand >> application [

	^ self context application
]

{ #category : 'as yet unclassified' }
OMZSpAbstractCommand >> selectedPlugin [
	"Answer the receiver's <OMZPluginObject> selected plugin"

	^ self context selectedItem.
]

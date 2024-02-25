"
Just an abstract class to provide subclasses commonly used methods such as access to the Application and the currently selected plugin.

See subclasses for details.
"
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

{ #category : 'accessing' }
OMZSpAbstractCommand >> selectedPlugin [
	"Answer the receiver's <OMZPluginObject> selected plugin"

	^ self context selectedItem.
]

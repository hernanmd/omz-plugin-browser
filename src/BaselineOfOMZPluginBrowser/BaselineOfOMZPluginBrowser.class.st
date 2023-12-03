Class {
	#name : 'BaselineOfOMZPluginBrowser',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOMZPluginBrowser',
	#package : 'BaselineOfOMZPluginBrowser'
}

{ #category : 'baselines' }
BaselineOfOMZPluginBrowser >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'OMZPluginBrowser';
				package: 'OMZPluginBrowser-Tests'	with: [ spec requires: #(OMZPluginBrowser) ].
			spec 
				group: 'Core' 						with: #('OMZPluginBrowser');
				group: 'Tests' 						with: #('OMZPluginBrowser' 'OMZPluginBrowser-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]

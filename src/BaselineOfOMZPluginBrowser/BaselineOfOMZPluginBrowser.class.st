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
				package: 'OMZPluginBrowser-Spec'  with: [ spec requires: #(OMZPluginBrowser) ];
				package: 'OMZPluginBrowser-Tests'	with: [ spec requires: #(OMZPluginBrowser) ].
			spec 
				group: 'Core' 						with: #('OMZPluginBrowser');
				group: 'UI'                    with: #('OMZPluginBrowser-Spec');
				group: 'Tests' 						with: #('OMZPluginBrowser' 'OMZPluginBrowser-Tests');
				group: 'default' 					with: #('Core' 'Tests' 'UI') ]
]

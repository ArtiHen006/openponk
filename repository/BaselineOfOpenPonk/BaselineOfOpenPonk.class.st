"
I am baseline for the core and all-in-one dynacase.
https://dynacase.github.io/
"
Class {
	#name : #BaselineOfOpenPonk,
	#superclass : #BaselineOf,
	#category : 'BaselineOfOpenPonk'
}

{ #category : #accessing }
BaselineOfOpenPonk >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self externalProjectsBaseline: spec.
			self internalProjectsBaseline: spec.
			spec
				package: 'OpenPonk-Core'
					with: [ spec
						requires: #('Magritte' 'Mocketry' 'Roassal2' 'PetitParser' 'XMLParser' 'XPath' 'NeoJSON') ];
				package: 'OpenPonk-Perf';
				package: 'OpenPonk-Trachel';
				package: 'OpenPonk-Roassal2';
				package: 'OpenPonk-Morphic';
				package: 'OpenPonk-Telemetry'
					with: [ spec requires: #('Sentry') ];
				package: 'OpenPonk-Help';
				package: 'OpenPonk-Spec'
					with: [ spec requires: #('Merlin' 'FileDialog' 'Magritte' 'Commander' 'SynchronizedLinks' 'OpenPonk-Morphic') ];
				package: 'OpenPonk-UI';
				package: 'OpenPonk-Plugins'
					with: [ spec postLoadDoIt: #postLoadPlugins ].
			spec
				group: 'default'
				with: #('OpenPonk-Core' 'OpenPonk-Perf' 'OpenPonk-Trachel' 'OpenPonk-Roassal2' 'OpenPonk-Morphic' 'OpenPonk-Spec' 'OpenPonk-UI' 'OpenPonk-Telemetry' 'OpenPonk-Help').
			spec group: 'complete' with: #('default' 'OpenPonk-Plugins') ]
]

{ #category : #accessing }
BaselineOfOpenPonk >> externalProjectsBaseline: spec [
	spec
		baseline: 'Commander'
		with: [ spec repository: 'github://pharo-ide/Commander/src' ].
	spec
		project: 'XMLParser'
		with: [ spec
				className: 'ConfigurationOfXMLParser';
				versionString: #stable;
				loads: #('Core');
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main' ].
	spec
		project: 'XPath'
		with: [ spec
				className: #ConfigurationOfXPath;
				versionString: #stable;
				loads: #(Core);
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XPath/main/' ].
	spec
		baseline: 'Roassal2'
		with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
	spec
		project: 'Magritte'
		with: [ spec
				className: #ConfigurationOfMagritte3;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main/' ].
	spec
		project: 'Merlin'
		with: [ spec
				className: #ConfigurationOfMerlin;
				versionString: #development;
				repository: 'http://www.smalltalkhub.com/mc/Moose/Merlin/main' ].
	spec
		baseline: 'Mocketry'
		with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x' ].
	spec
		baseline: 'PetitParser'
		with: [ spec
				loads: 'ParserCore';
				repository: 'github://moosetechnology/PetitParser/src' ].
	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #accessing }
BaselineOfOpenPonk >> internalProjectsBaseline: spec [
	spec
		baseline: 'FileDialog'
		with: [ spec repository: 'github://peteruhnak/file-dialog:v1.x/repository' ].
	spec
		baseline: 'Sentry'
		with: [ spec repository: 'github://peteruhnak/pharo-sentry:v1.x/repository' ].
	spec
		baseline: 'SynchronizedLinks'
		with: [ spec repository: 'github://openponk/synchronized-links:v1.x/repository' ]
]

{ #category : #accessing }
BaselineOfOpenPonk >> postLoadPlugins [
	Metacello new
		baseline: 'BormEditor';
		repository: 'github://openponk/borm-editor:v0.9.0/repository';
		onConflict: [ :ex | ex allow ];
		load.
	Metacello new
		baseline: 'ClassEditor';
		repository: 'github://openponk/class-editor:v1.x/repository';
		onConflict: [ :ex | ex allow ];
		load
]
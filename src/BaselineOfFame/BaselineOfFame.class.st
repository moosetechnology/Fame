"
Baseline for the Fame project.
"
Class {
	#name : #BaselineOfFame,
	#superclass : #BaselineOf,
	#category : #BaselineOfFame
}

{ #category : #baselines }
BaselineOfFame >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self
			hashtable: spec;
			mocketry: spec;
			pharoBackwardCompatibility: spec;
			iterators: spec;
			treeQuery: spec.

		"Packages"
		spec
			package: 'Fame-Core' with: [
				spec requires:
						#( 'TreeQuery' 'Iterators' 'PharoBackwardCompatibility' ) ];
			package: 'Fame-Rules';
			package: 'Fame-ImportExport'
			with: [ spec requires: #( 'Fame-Core' 'Hashtable' ) ];
			package: 'Fame-Example';
			package: 'Fame-Tests' with: [
				spec requires:
						#( 'Fame-Core' 'Fame-ImportExport' 'Fame-Example' 'Mocketry' ) ];
			package: 'Fame-Deprecated'
			with: [ spec requires: #( 'Fame-ImportExport' ) ].

		spec for: #( #'pharo6.x' #'pharo7.x' #'pharo8.x' ) do: [
			spec
				package: 'Fame-GT'
				with: [ spec requires: #( 'Fame-ImportExport' ) ] ].
		spec for: (self pharoVersionsFrom: 9) do: [
			spec
				package: 'Fame-Inspection'
				with: [ spec requires: #( 'Fame-Core' ) ] ].

		"Groups"
		spec
			group: 'Core'
			with: #( 'Fame-Core' 'Fame-ImportExport' 'Fame-Rules' );
			group: 'Deprecated' with: #( 'Core' 'Fame-Deprecated' );
			group: 'Tests' with: #( 'Fame-Tests' ) ]
]

{ #category : #dependencies }
BaselineOfFame >> hashtable: spec [
	spec
		baseline: 'Hashtable'
		with: [ spec
				loads: 'Core';
				repository: 'github://pharo-contributions/Hashtable:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFame >> iterators: spec [

	spec baseline: 'Iterators' with: [
		spec
			repository: 'github://juliendelplanque/Iterators:v1.x.x/src';
			loads: #( 'core' 'collections' 'shell-dsl' ) ]
]

{ #category : #dependencies }
BaselineOfFame >> mocketry: spec [

	spec baseline: 'Mocketry' with: [
		spec
			loads: #( 'Core' );
			repository: 'github://dionisiydk/Mocketry:v7.0.2' ]
]

{ #category : #dependencies }
BaselineOfFame >> pharoBackwardCompatibility: spec [
	spec baseline: 'PharoBackwardCompatibility' with: [ spec repository: 'github://jecisc/PharoBackwardCompatibility:v1.x.x/src' ]
]

{ #category : #accessing }
BaselineOfFame >> pharoVersionsFrom: aVersion [

	^ (aVersion to: SystemVersion current major) collect: [ :v | ('pharo' , v asString , '.x') asSymbol ]
]

{ #category : #accessing }
BaselineOfFame >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfFame >> treeQuery: spec [
	spec baseline: 'TreeQuery' with: [ 
		spec
			repository: 'github://juliendelplanque/TreeQuery:v1.x.x/src';
			loads: #('core') ]
]

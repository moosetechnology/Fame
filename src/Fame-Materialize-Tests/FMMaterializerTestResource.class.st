Class {
	#name : 'FMMaterializerTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'metamodel'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'running' }
FMMaterializerTestResource >> metamodel [

	^ metamodel
]

{ #category : 'running' }
FMMaterializerTestResource >> setUp [

	| trait class |
	super setUp.
	metamodel := FMMetaModel new.
	metamodel add: (FM3Package named: 'Fame-Materialize-TestResource').
	trait := FM3Trait named: 'TATrait'.
	metamodel add: trait.
	class := FM3Class named: 'AClass'.
	metamodel add: class
]

{ #category : 'running' }
FMMaterializerTestResource >> tearDown [

	[ 'Fame-Materialize-TestResource' asPackage removeFromSystem ]
		on: NotFound
		do: [ ].
	super tearDown
]

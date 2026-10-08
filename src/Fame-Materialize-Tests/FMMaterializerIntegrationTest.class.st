Class {
	#name : 'FMMaterializerIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'materializer',
		'packages'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'running' }
FMMaterializerIntegrationTest >> setUp [

	super setUp.
	materializer := FMMaterializer new
]

{ #category : 'running' }
FMMaterializerIntegrationTest >> tearDown [

	packages do: [ :package |
			[ package asPackage removeFromSystem ]
				on: Error
				do: [ ] ].
	super tearDown
]

{ #category : 'running' }
FMMaterializerIntegrationTest >> testFamixTest1Model [

	| metamodel |
	metamodel := FamixTest1Model resetMetamodel.
	metamodel packages do: [ :namedElement |
		namedElement name: 'FMMaterializer' , namedElement name ].
	packages := metamodel packages.
	packages do: [ :package |
			package classes do: [ :class |
				class name:
					(package name , class name copyReplaceAll: '-' with: '') ] ].
	FMMaterializer new materialize: metamodel.
	self halt
]

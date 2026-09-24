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

	super setUp.
	metamodel := FMMetaModel new.
	metamodel add: (FM3Package named: 'Fame-Materialize-TestResource')
]

{ #category : 'running' }
FMMaterializerTestResource >> tearDown [

	[ 'Fame-Materialize-TestResource' asPackage removeFromSystem ]
		on: NotFound
		do: [ ].
	super tearDown
]

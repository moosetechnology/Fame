Class {
	#name : 'FMMaterializerTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'metamodel',
		'trait',
		'class',
		'superclass'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'accessing' }
FMMaterializerTestResource >> clazz [

	^ class
]

{ #category : 'running' }
FMMaterializerTestResource >> metamodel [

	^ metamodel
]

{ #category : 'running' }
FMMaterializerTestResource >> setUp [

	super setUp.
	metamodel := FMMetaModel new.
	metamodel add: (FM3Package named: 'Fame-Materialize-TestResource').
	trait := FM3Trait named: 'TATrait'.
	metamodel add: trait.
	class := FM3Class named: 'AClass'.
	metamodel add: class.
	superclass := FM3Class named: 'ASuperClass'.
	metamodel add: superclass.
]

{ #category : 'accessing' }
FMMaterializerTestResource >> superclass [

	^ superclass
]

{ #category : 'running' }
FMMaterializerTestResource >> tearDown [

	[ 'Fame-Materialize-TestResource' asPackage removeFromSystem ]
		on: NotFound
		do: [ ].
	super tearDown
]

{ #category : 'accessing' }
FMMaterializerTestResource >> trait [

	^ trait
]

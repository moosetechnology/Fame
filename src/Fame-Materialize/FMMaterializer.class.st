Class {
	#name : 'FMMaterializer',
	#superclass : 'Object',
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'private' }
FMMaterializer >> materialize: aFMMetaModel [

	aFMMetaModel packages do: [ :package |
		self materializePackage: package ].
	aFMMetaModel traits do: [ :trait | self materializeTrait: trait ].
	aFMMetaModel classes do: [ :fm3Class | self materializeClass: fm3Class ].
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializeClass: aFM3Class [

	| classBuilder superClass |
	aFM3Class package ifNil: [ FMMaterializerNoPackageError signal ].
	superClass := aFM3Class superclass isRoot
		              ifTrue: [ Object ]
		              ifFalse: [ self materializeClass: aFM3Class superclass ].
	classBuilder := superClass << aFM3Class name package:
		                aFM3Class package name.
	^ classBuilder install
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializePackage: aFM3Package [

	self packageOrganizer ensurePackage: aFM3Package name
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializeTrait: aFM3Trait [

	| traitBuilder |
	aFM3Trait package ifNil: [ FMMaterializerNoPackageError signal ].

	traitBuilder := (Trait << aFM3Trait name)
		                tag: 'Traits';
		                package: aFM3Trait package name.
	traitBuilder install
]

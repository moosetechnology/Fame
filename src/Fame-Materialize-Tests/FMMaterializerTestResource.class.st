"
I build a metamodel that can be used to be materialized and clean what could have been created by tests
"
Class {
	#name : 'FMMaterializerTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'metamodel',
		'trait',
		'class',
		'superclass',
		'propertyA',
		'anotherClass',
		'relationClassToAnotherClass',
		'relationAnotherClassToClass',
		'package'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'accessing' }
FMMaterializerTestResource >> anotherClass [

	^ anotherClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> clazz [

	^ class
]

{ #category : 'running' }
FMMaterializerTestResource >> metamodel [

	^ metamodel
]

{ #category : 'running' }
FMMaterializerTestResource >> propertyA [

	^ propertyA
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationAnotherClassToClass [

	^ relationAnotherClassToClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationAnotherClassToClass: anObject [

	relationAnotherClassToClass := anObject
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationClassToAnotherClass [

	^ relationClassToAnotherClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationClassToAnotherClass: anObject [

	relationClassToAnotherClass := anObject
]

{ #category : 'running' }
FMMaterializerTestResource >> setUp [

	super setUp.
	metamodel := FMMetaModel new.
	package := FM3Package named: 'Fame-Materialize-TestResource'.
	metamodel add: package.
	trait := FM3Trait named: 'TATrait'.
	metamodel add: trait.
	class := FM3Class named: 'AClass'.
	metamodel add: class.
	anotherClass := FM3Class named: 'AnotherClass'.
	metamodel add: anotherClass.
	superclass := FM3Class named: 'ASuperClass'.
	metamodel add: superclass.
	trait users: {
			class.
			anotherClass }.
	class traits: { trait }.
	anotherClass traits: { trait }.
	propertyA := (FM3Property named: 'aProperty') type:
		             FM3String instance.
	relationClassToAnotherClass := (FM3Property named:
		                                'relationClassToAnotherClass')
		                               type: anotherClass.
	relationClassToAnotherClass isMultivalued: true.
	relationAnotherClassToClass := (FM3Property named:
		                                'relationAnotherClassToClass')
		                               type: class.
	relationClassToAnotherClass opposite: relationAnotherClassToClass.
	relationAnotherClassToClass opposite: relationClassToAnotherClass.
	class properties: {
			propertyA.
			relationClassToAnotherClass }.
	anotherClass properties: { relationAnotherClassToClass }.
	trait package: package
]

{ #category : 'accessing' }
FMMaterializerTestResource >> superclass [

	^ superclass
]

{ #category : 'running' }
FMMaterializerTestResource >> tearDown [

	[ 'Fame-Materialize-TestResource' asPackage removeFromSystem ]
		on: Error
		do: [ ].
	super tearDown
]

{ #category : 'accessing' }
FMMaterializerTestResource >> trait [

	^ trait
]

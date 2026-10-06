"
A FMMaterializerTest is a test class for testing the behavior of FMMaterializer
"
Class {
	#name : 'FMMaterializerTest',
	#superclass : 'TestCase',
	#instVars : [
		'materializer'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'accessing' }
FMMaterializerTest class >> resources [
	^ { FMMaterializerTestResource }
]

{ #category : 'running' }
FMMaterializerTest >> setUp [

	super setUp.
	materializer := FMMaterializer new
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClass [

	| class |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeClass: class.
	self assert: (Smalltalk globals includesKey: class name)
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexPropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >>
	          FMMaterializerTestResource current
		          relationClassToAnotherClass name.

	self assert: (getter hasPragmaNamed: 'generated').
	self assert: (getter hasPragmaNamed: 'FMComment:').
	"not hosted here?"
	self deny: (getter hasPragmaNamed: 'FMProperty:type:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexPropertyOneSlot [

	| class implementationClass slot |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	FMMaterializerTestResource current anotherClass package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.
	materializer materializeClass:
		FMMaterializerTestResource current anotherClass.

	implementationClass := Smalltalk globals at:
		                       FMMaterializerTestResource current
			                       anotherClass name.

	self assert:
		(implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'relationAnotherClassToClass' ]).
	slot := implementationClass slots detect: [ :existingSlot |
		        existingSlot name = 'relationAnotherClassToClass' ].
	self assert: slot class equals: FMOne
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexPropertySlot [

	| class implementationClass slot |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.

	implementationClass := Smalltalk globals at: class name.

	self assert:
		(implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'relationClassToAnotherClass' ]).
	slot := implementationClass slots detect: [ :existingSlot |
		        existingSlot name = 'relationClassToAnotherClass' ].
	self assert: slot class equals: FMMany
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitivePropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >> FMMaterializerTestResource current propertyA name.

	self assert: (getter hasPragmaNamed: 'generated').
	self assert: (getter hasPragmaNamed: 'FMComment:').
	self assert: (getter hasPragmaNamed: 'FMProperty:type:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitivePropertySetter [

	| class |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.
	self assert: ((Smalltalk globals at: class name)
		 >> FMMaterializerTestResource current propertyA name asMutator)
			isNotNil
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassProperty [

	| class |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass: class.
	self
		assert: (Smalltalk globals at: class name) slots anyOne name
		equals: FMMaterializerTestResource current propertyA name.
	self
		assert: (Smalltalk globals at: class name) slots anyOne class
		equals: FMProperty
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassWithSuperClassReverseOrder [

	| class superclass |
	class := FMMaterializerTestResource current clazz.
	superclass := FMMaterializerTestResource current superclass.
	class superclass: superclass.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	superclass package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeClass: class.
	materializer materializeClass: superclass.
	self assert: (Smalltalk globals includesKey: class name).
	self
		assert: (Smalltalk globals at: class name) superclass name
		equals: superclass name
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassWithSuperClassSimpleOrder [

	| class superclass |
	class := FMMaterializerTestResource current clazz.
	superclass := FMMaterializerTestResource current superclass.
	class superclass: superclass.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	superclass package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeClass: superclass.
	materializer materializeClass: class.
	self assert: (Smalltalk globals includesKey: class name).
	self
		assert: (Smalltalk globals at: class name) superclass name
		equals: superclass name
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassWithoutPackage [

	self
		assertBlock: [
				materializer materializeClass:
					FMMaterializerTestResource current metamodel classes anyOne ]
		raises: FMMaterializerNoPackageError
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializePackage [

	materializer materializePackage:
		FMMaterializerTestResource current metamodel packages anyOne.
	self packageOrganizer hasPackage:
		FMMaterializerTestResource current metamodel packages anyOne name
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTrait [

	| trait |
	trait := FMMaterializerTestResource current metamodel traits anyOne.
	trait package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeTrait: trait.
	self assert: (Smalltalk globals includesKey: trait name)
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTraitWithoutPackage [

	self
		assertBlock: [
				materializer materializeTrait:
					FMMaterializerTestResource current metamodel traits anyOne ]
		raises: FMMaterializerNoPackageError
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeWithSuperClass [

	| class |
	class := FMMaterializerTestResource current metamodel classes anyOne.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeClass: class.
	self assert: (Smalltalk globals includesKey: class name)
]

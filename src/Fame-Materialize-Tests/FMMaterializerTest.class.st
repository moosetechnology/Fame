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
FMMaterializerTest >> testMaterialize [

	self
		shouldnt: [
			materializer materialize:
				FMMaterializerTestResource current metamodel ]
		raise: Error
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClass [

	| class |
	class := FMMaterializerTestResource current clazz.
	materializer materializeClass: class.
	self assert: (Smalltalk globals includesKey: class name)
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassAnnotationSuperIsImplementation [

	| class implementingClass |
	class := FMMaterializerTestResource current clazz.
	implementingClass := materializer materializeClass: class.
	self
		assert:
			((implementingClass class >> #annotation pragmaAt: #FMClass:super:)
				 argumentNamed: #super:)
		equals: implementingClass superclass name
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexPropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.

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
FMMaterializerTest >> testMaterializeClassComplexPropertyGetterHasComment [

	| class getter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >>
	          FMMaterializerTestResource current
		          relationClassToAnotherClass name.

	self
		assert: (getter pragmaAt: #FMComment:) arguments first
		equals:
		FMMaterializerTestResource current
			relationClassToAnotherClassComment
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexPropertyOneSlot [

	| class implementationClass slot |
	class := FMMaterializerTestResource current clazz.
	
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
FMMaterializerTest >> testMaterializeClassComplexPropertyWithoutOpposite [

	| class implementationClass slot |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	implementationClass := Smalltalk globals at: class name.

	self assert:
		(implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'propertyWithoutOpposite' ]).
	slot := implementationClass slots detect: [ :existingSlot |
		        existingSlot name = 'propertyWithoutOpposite' ].
	self assert: slot class equals: FMMany
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexRemotePropertyGetterPackage [

	| class getter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >>
	          FMMaterializerTestResource current
		          relationClassToRemoteClass name.
	self
		assert: getter package name
		equals:
			FMMaterializerTestResource current relationClassToRemoteClass
				package name.
	self assert: (getter hasPragmaNamed: 'generated')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexRemotePropertySetterPackage [

	| class setter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	setter := (Smalltalk globals at: class name)
	          >>
		          FMMaterializerTestResource current
			          relationClassToRemoteClass name asMutator.
	self
		assert: setter package name
		equals:
			FMMaterializerTestResource current relationClassToRemoteClass
				package name.
	self assert: (setter hasPragmaNamed: 'generated')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassComplexRemotePropertySlot [

	| class |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	self assert:
		((Smalltalk globals at: class name) slots noneSatisfy: [ :slot |
				 slot name
				 = FMMaterializerTestResource current remoteNumberPropertyName ])
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassHasAnnotationClassSide [

	| class implementingClass |
	class := FMMaterializerTestResource current clazz.
	implementingClass := materializer materializeClass: class.
	self assert: (implementingClass class >> #annotation hasPragmaNamed: #'FMClass:super:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitiveObjectPropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.
	
	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >> #objectProperty.

	self assert: (getter hasPragmaNamed: 'generated').
	self assert: (getter hasPragmaNamed: 'FMComment:').
	self assert: (getter hasPragmaNamed: 'FMProperty:type:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitivePropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.
	
	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >> FMMaterializerTestResource current propertyA name.

	self assert: (getter hasPragmaNamed: 'generated').
	self assert: (getter hasPragmaNamed: 'FMComment:').
	self assert: (getter hasPragmaNamed: 'FMProperty:type:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitivePropertyGetterHasComment [

	| class getter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >> FMMaterializerTestResource current propertyA name.

	self
		assert: (getter pragmaAt: #FMComment:) arguments first
		equals: FMMaterializerTestResource current propertyAComment
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitivePropertySetter [

	| class |
	class := FMMaterializerTestResource current clazz.
	
	materializer materializeClass: class.
	self assert: ((Smalltalk globals at: class name)
		 >> FMMaterializerTestResource current propertyA name asMutator)
			isNotNil
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitiveRemoteProperty [
	"remote properties are added using getter in a remote method and using cache instead of with a slot"

	| class |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.
	self assert:
		((Smalltalk globals at: class name) slots noneSatisfy: [ :slot |
				 slot name
				 = FMMaterializerTestResource current remoteNumberPropertyName ])
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitiveRemotePropertyGetter [

	| class getter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	getter := (Smalltalk globals at: class name)
	          >>
	          FMMaterializerTestResource current remoteNumberPropertyName.
	self
		assert: getter package name
		equals: FMMaterializerTestResource current remotePackageName.
	self assert: (getter hasPragmaNamed: 'generated')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassPrimitiveRemotePropertySetter [

	| class setter |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.

	setter := (Smalltalk globals at: class name)
	          >>
	          FMMaterializerTestResource current remoteNumberPropertyName
		          asMutator.
	self
		assert: setter package name
		equals: FMMaterializerTestResource current remotePackageName.
	self assert: (setter hasPragmaNamed: 'generated')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassProperty [

	| class |
	class := FMMaterializerTestResource current clazz.
	
	materializer materializeClass: class.
	self
		assert: (Smalltalk globals at: class name) slots anyOne name
		equals: FMMaterializerTestResource current propertyA name.
	self
		assert: (Smalltalk globals at: class name) slots anyOne class
		equals: FMProperty
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassUseTrait [

	| class |
	class := FMMaterializerTestResource current clazz.
	
	materializer materializeClass: class.
	self
		assert: (Smalltalk globals at: class name) traits anyOne name
		equals: FMMaterializerTestResource current trait name
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeClassWithSuperClassReverseOrder [

	| class superclass |
	class := FMMaterializerTestResource current clazz.
	superclass := FMMaterializerTestResource current superclass.
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
FMMaterializerTest >> testMaterializePropertyOfSuperClass [

	| class implementationClass |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	FMMaterializerTestResource current superclass package:
		FMMaterializerTestResource current metamodel packages anyOne.

	materializer materializeClass:
		FMMaterializerTestResource current superclass.
	materializer materializeClass: class.

	implementationClass := Smalltalk globals at:
		                       FMMaterializerTestResource current superclass
			                       name.
	self assert: (implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'superclassProperty' ])
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializePropertyOfSuperClassReverseOrder [

	| class implementationClass |
	class := FMMaterializerTestResource current clazz.

	materializer materializeClass: class.
	materializer materializeClass:
		FMMaterializerTestResource current superclass.

	implementationClass := Smalltalk globals at:
		                       FMMaterializerTestResource current superclass
			                       name.
	self assert:
		(implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'superclassProperty' ])
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
FMMaterializerTest >> testMaterializeTraitHasAnnotationClassSide [

	| trait implementingTrait |
	trait := FMMaterializerTestResource current trait.
	implementingTrait := materializer materializeTrait: trait.
	self assert: (implementingTrait class >> #annotation hasPragmaNamed: #'FMClass:super:')
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTraitWithoutPackage [
	FMMaterializerTestResource current metamodel traits anyOne package: nil.
	self
		assertBlock: [
				materializer materializeTrait:
					FMMaterializerTestResource current metamodel traits anyOne ]
		raises: FMMaterializerNoPackageError
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTwicePropertyOnSuperclassAndClass [

	| class implementationClass |
	
	class := FMMaterializerTestResource current clazz.
	materializer materializeClass:
		FMMaterializerTestResource current superclass.
	materializer materializeClass: class.
	implementationClass := Smalltalk globals at:
		                       FMMaterializerTestResource current superclass
			                       name.
	
	self assert: (implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'duplicatedProperty' ])
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTwicePropertyOnSuperclassAndClassReverseOrder [

	| class implementationClass |
	class := FMMaterializerTestResource current clazz.
	class package:
		FMMaterializerTestResource current metamodel packages anyOne.
	FMMaterializerTestResource current superclass package:
		FMMaterializerTestResource current metamodel packages anyOne.
	materializer materializeClass: class.
	materializer materializeClass:
		FMMaterializerTestResource current superclass.

	implementationClass := Smalltalk globals at:
		                       FMMaterializerTestResource current superclass
			                       name.
	self assert:
		(implementationClass slots anySatisfy: [ :existingSlot |
			 existingSlot name = 'duplicatedProperty' ])
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterializeTwicePropertyOnSuperclassAndClassWithoutTraits [

	| class |
	"Pharo uses a tool to help instaling classes with trait that can create unpredictable code generation"
	class := FMMaterializerTestResource current clazz.
	self assert: ((materializer computeSlotsForType: class) noneSatisfy: [ :s | s name = 'duplicatedProperty' ])
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

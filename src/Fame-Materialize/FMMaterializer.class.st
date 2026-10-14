Class {
	#name : 'FMMaterializer',
	#superclass : 'Object',
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'as yet unclassified' }
FMMaterializer >> computeSlotsForType: aFM3Class [

	| slots filteredSlots |
	slots := aFM3Class primitiveProperties
		         reject: [ :primitiveProperty |
				         primitiveProperty package isNotNil and: [
					         primitiveProperty package ~= aFM3Class package ] ]
		         thenCollect: [ :primitiveProperty |
		         primitiveProperty name => FMProperty ].
	
	slots addAll: (aFM3Class complexProperties
			 reject: [ :primitiveProperty |
					 primitiveProperty package isNotNil and: [
						 primitiveProperty package ~= aFM3Class package ] ]
			 thenCollect: [ :complexProperty |
					 | slotClass |
					 slotClass := complexProperty isMultivalued
						              ifTrue: [ FMMany ]
						              ifFalse: [ FMOne ].
					 complexProperty opposite
						 ifNotNil: [
								 complexProperty name => slotClass
									 type: complexProperty type name asSymbol
									 opposite: complexProperty opposite name asSymbol ]
						 ifNil: [
								 complexProperty name => slotClass inClass:
									 complexProperty type name asSymbol ] ]).
	filteredSlots := slots reject: [ :slot |
			                 aFM3Class superclass allProperties anySatisfy: [
				                 :superProperty | superProperty name = slot name ] ].

	^ filteredSlots
]

{ #category : 'private' }
FMMaterializer >> materialize: aFMMetaModel [

	aFMMetaModel packages do: [ :package |
		self materializePackage: package ].
	aFMMetaModel traits do: [ :trait | self materializeTrait: trait ].
	aFMMetaModel classes do: [ :fm3Class | self materializeClass: fm3Class ].
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializeClass: aFM3Class [

	| classBuilder superClass implementedClass slots |
	aFM3Class package ifNil: [ FMMaterializerNoPackageError signal ].
	superClass := aFM3Class superclass isRoot
		              ifTrue: [ Object ]
		              ifFalse: [
		              self materializeClass: aFM3Class superclass ].
	classBuilder := superClass << aFM3Class name package:
		                aFM3Class package name.
	classBuilder traits: (aFM3Class traits
			 collect: [ :trait | self materializeTrait: trait ]
			 as: Array).
	slots := self computeSlotsForType: aFM3Class.
	classBuilder slots: slots.
	implementedClass := classBuilder install.
	aFM3Class implementingClass: implementedClass.
	aFM3Class primitiveProperties do: [ :primitiveProperty |
		self materializePrimitiveProperty: primitiveProperty ].
	aFM3Class complexProperties do: [ :complexProperty |
		self materializeComplexProperty: complexProperty ].
	^ implementedClass
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializeComplexProperty: aFM3Property [

	| owner accessorTransformation |
	owner := aFM3Property mmClass implementingClass.
	accessorTransformation := FMMaterializerAddComplexPropertyAccessorTransformation
		                          fm3Property: aFM3Property
		                          class: owner.
	accessorTransformation createSetterAccessor.
	accessorTransformation createGetterAccessor.
	accessorTransformation performChanges
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializePackage: aFM3Package [

	self packageOrganizer ensurePackage: aFM3Package name
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializePrimitiveProperty: aFM3Property [

	| owner accessorTransformation |
	owner := aFM3Property mmClass implementingClass.
	accessorTransformation := FMMaterializerAddPrimitivePropertyAccessorTransformation
		                          fm3Property: aFM3Property
		                          class: owner.
	accessorTransformation createSetterAccessor.
	accessorTransformation createGetterAccessor.
	accessorTransformation performChanges
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializeTrait: aFM3Trait [

	| traitBuilder implementingTrait |
	aFM3Trait package ifNil: [ FMMaterializerNoPackageError signal ].

	traitBuilder := (Trait << aFM3Trait name)
		                tag: 'Traits';
		                package: aFM3Trait package name.
	implementingTrait := traitBuilder install.
	aFM3Trait implementingClass: implementingTrait.
	^ implementingTrait
]

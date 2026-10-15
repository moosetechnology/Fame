Class {
	#name : 'FMMaterializer',
	#superclass : 'Object',
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'private' }
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
FMMaterializer >> isPropertyRemote: aFM3Property [

	^ aFM3Property package isNotNil and: [
		  aFM3Property package ~= aFM3Property owner package ]
]

{ #category : 'api' }
FMMaterializer >> materialize: aFMMetaModel [

	aFMMetaModel packages do: [ :package |
		self materializePackage: package ].
	aFMMetaModel traits do: [ :trait | self materializeTrait: trait ].
	aFMMetaModel classes do: [ :fm3Class | self materializeClass: fm3Class ].
]

{ #category : 'private' }
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
	self materializeTypeFameAnnotation: aFM3Class.
	^ implementedClass
]

{ #category : 'private' }
FMMaterializer >> materializeComplexProperty: aFM3Property [

	| owner accessorTransformation |
	owner := aFM3Property mmClass implementingClass.
	accessorTransformation := ((self isPropertyRemote: aFM3Property)
		                           ifTrue: [
				                           self materializePackage:
					                           aFM3Property package.
				                           FMMaterializerAddRemoteComplexPropertyAccessorTransformation ]
		                           ifFalse: [
		                           FMMaterializerAddComplexPropertyAccessorTransformation ])
		                          fm3Property: aFM3Property
		                          class: owner.
	accessorTransformation createSetterAccessor.
	accessorTransformation createGetterAccessor.
	accessorTransformation performChanges
]

{ #category : 'private' }
FMMaterializer >> materializePackage: aFM3Package [

	(RBAddPackageChange addPackageNamed: aFM3Package name) execute
]

{ #category : 'private' }
FMMaterializer >> materializePrimitiveProperty: aFM3Property [

	| owner accessorTransformation |
	owner := aFM3Property mmClass implementingClass.
	accessorTransformation := ((self isPropertyRemote: aFM3Property)
		                           ifTrue: [
				                           self materializePackage:
					                           aFM3Property package.
				                           FMMaterializerAddRemotePrimitivePropertyAccessorTransformation ]
		                           ifFalse: [
		                           FMMaterializerAddPrimitivePropertyAccessorTransformation ])
		                          fm3Property: aFM3Property
		                          class: owner.
	accessorTransformation createSetterAccessor.
	accessorTransformation createGetterAccessor.
	accessorTransformation performChanges
]

{ #category : 'private' }
FMMaterializer >> materializeTrait: aFM3Trait [

	| traitBuilder implementingTrait |
	aFM3Trait package ifNil: [ FMMaterializerNoPackageError signal ].

	traitBuilder := (Trait << aFM3Trait name)
		                tag: 'Traits';
		                package: aFM3Trait package name.
	implementingTrait := traitBuilder install.
	aFM3Trait implementingClass: implementingTrait.
	self materializeTypeFameAnnotation: aFM3Trait.
	^ implementingTrait
]

{ #category : 'private' }
FMMaterializer >> materializeTypeFameAnnotation: aFM3Type [

	| sourceCode |
	sourceCode := 'annotation<r><r><t>%<ignoreForCoverage><r><t>%<FMClass: #<1s> super: #<3s>><r><t>%<package: #''<2s>''><r><t>%<generated>'.
	(RBAddMethodTransformation
		 sourceCode: (sourceCode expandMacrosWithArguments: {
					  aFM3Type name.
					  aFM3Type package name.
					  (aFM3Type isFM3Trait
						   ifTrue: [ 'Object' ]
						   ifFalse: [ aFM3Type superclass name ]) })
		 in: aFM3Type implementingClass class
		 withProtocol: #meta) generateChanges execute
]

Class {
	#name : #FMMetaMetaModelTest,
	#superclass : #TestCase,
	#instVars : [
		'metaMetaModel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMetaMetaModelTest >> assertDefaultValueFor: fullName is: aValue [
	| method pragma defaultValue prop implementingSelector implementingClass |
	
	prop := self findProperty: fullName.
	self assert: prop hasDefaultValue.
	
	implementingSelector := prop implementingSelector.
	implementingClass := prop mmClass implementingClass.
	method := implementingClass lookupSelector: implementingSelector.
	
	self assert: method pragmas isNotEmpty.
	
	pragma := method pragmas at: 1.
	self assert: pragma selector equals: #FMProperty:type:defaultValue:.
	
	defaultValue := pragma arguments at: 3.
	
	
	self assert: prop defaultValue equals: defaultValue.
	self assert: prop defaultValue equals: aValue.
	self assert: defaultValue equals: aValue.
]

{ #category : #tests }
FMMetaMetaModelTest >> findProperty: fullName [
	^ (metaMetaModel elements select: [ :each | each fullName = fullName ]) at: 1.
]

{ #category : #running }
FMMetaMetaModelTest >> setUp [
	super setUp.
	metaMetaModel := FMMetaMetaModel default.
	metaMetaModel class reset.
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3 [
	self assert: metaMetaModel isNotNil
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3Classes [
	self assert: (metaMetaModel descriptionOf: FM3Element ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Property ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Package ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Class ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FMMetaModelTest ifAbsent: [ nil ]) isNil
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3DefaultValue [
	self assertDefaultValueFor: 'FM3.Property.container' is: false.
	self assertDefaultValueFor: 'FM3.Property.derived' is: false.
	self assertDefaultValueFor: 'FM3.Property.multivalued' is: false.
	self assertDefaultValueFor: 'FM3.Class.abstract' is: false.
	self assertDefaultValueFor: 'FM3.Class.root' is: false.
	self assertDefaultValueFor: 'FM3.Class.primitive' is: false.
	self assertDefaultValueFor: 'FM3.Trait.primitive' is: false.
	self assertDefaultValueFor: 'FM3.Trait.root' is: false.

	self assert: (self findProperty: 'FM3.Element.fullName') defaultValue equals: nil.
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| names |
	self assert: metaMetaModel isNotNil.	"boot strapping FM3 does internally run the pragma processor"
	names := metaMetaModel elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (metaMetaModel elements detect: [ :el | el fullName = 'FM3.Type.package' ]) opposite
		equals: (metaMetaModel elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).
	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	self assert: (names includes: 'FM3.Element').
	self assert: (names includes: 'FM3.Element.name').
	self assert: (names includes: 'FM3.Element.fullName').
	self assert: (names includes: 'FM3.Element.owner').
	self assert: (names includes: 'FM3.Class').
	self assert: (names includes: 'FM3.Class.abstract').
	self assert: (names includes: 'FM3.Class.primitive').
	self assert: (names includes: 'FM3.Class.root').
	self assert: (names includes: 'FM3.Class.superclass').
	self assert: (names includes: 'FM3.Class.subclasses').
	self assert: (names includes: 'FM3.Type').
	self assert: (names includes: 'FM3.Type.traits').
	self assert: (names includes: 'FM3.Type.package').
	self assert: (names includes: 'FM3.Type.allProperties').
	self assert: (names includes: 'FM3.Type.properties').
	self assert: (names includes: 'FM3.Property').
	self assert: (names includes: 'FM3.Property.composite').
	self assert: (names includes: 'FM3.Property.container').
	self assert: (names includes: 'FM3.Property.derived').
	self assert: (names includes: 'FM3.Property.multivalued').
	self assert: (names includes: 'FM3.Property.class').
	self assert: (names includes: 'FM3.Property.package').
	self assert: (names includes: 'FM3.Property.type').
	self assert: (names includes: 'FM3.Property.opposite').
	self assert: (names includes: 'FM3.Package').
	self assert: (names includes: 'FM3.Package.extensions').
	self assert: (names includes: 'FM3.Package.classes').
	self assert: (names includes: 'FM3.Trait').
	self assert: (names includes: 'FM3.Trait.primitive').
	self assert: (names includes: 'FM3.Trait.root').
	self assert: (names includes: 'FM3.Trait.users').
	self assert: (names includes: 'FM3.Property.defaultValue').
	self assert: names size equals: 34.
	self assert: (names select: [ :n | n beginsWith: 'FM3.' ]) size equals: 32
]

{ #category : #tests }
FMMetaMetaModelTest >> testMetaMetaModelIsItsOwnMetaModel [
	self assert: metaMetaModel metamodel identicalTo: metaMetaModel
]

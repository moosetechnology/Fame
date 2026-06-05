Class {
	#name : 'FM3ClassTest',
	#superclass : 'FM3ElementTest',
	#category : 'Fame-Tests-Core',
	#package : 'Fame-Tests',
	#tag : 'Core'
}

{ #category : 'helpers' }
FM3ClassTest >> actualClass [
	^ FM3Class
]

{ #category : 'helpers' }
FM3ClassTest >> addUnamedOwnerTo: anElement [
	anElement package: FM3Package new
]

{ #category : 'tests' }
FM3ClassTest >> testAllProperties [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: element allProperties isNotNil.
	self assert: element allProperties isCollection.
	self denyEmpty: element allProperties
]

{ #category : 'tests' }
FM3ClassTest >> testAllPropertiesDoGiveSameElementsAsAllProperties [

	| superclass class listWithPropDo listWithoutPropDo |
	superclass := self actualClass named: 'Superclass'.
	class := self actualClass named: 'Class'.
	class superclass: superclass.

	superclass properties: {
			(FM3Property named: #isDead).
			(FM3Property named: #numberOfLinesOfCode) }.
	class properties: {
			(FM3Property named: #isDead).
			(FM3Property named: #cc) }.

	"collecting with allPropertiesDo:"
	listWithPropDo := OrderedCollection new.
	class allPropertiesDo: [ :prop | listWithPropDo add: prop name ].

	"collecting with allProperties"
	listWithoutPropDo := class allProperties collect: [ :prop |
		                     prop name ].

	"the two lists should be equals"
	self
		assert: listWithPropDo asArray sorted equals: listWithoutPropDo asArray sorted
]

{ #category : 'tests' }
FM3ClassTest >> testAllPropertiesHasNoDuplication [

	| superclass class numberOfProperties expectedNumberOfProperties |
	superclass := self actualClass named: 'Superclass'.
	class := self actualClass named: 'Class'.
	class superclass: superclass.

	superclass properties: {
		(FM3Property named: #isDead).
		(FM3Property named: #numberOfLinesOfCode) }.
	class properties: {
		(FM3Property named: #isDead).
		(FM3Property named: #cc) }.

	numberOfProperties := 0.
	class allPropertiesDo: [ :each |
		numberOfProperties := numberOfProperties + 1 ].

	expectedNumberOfProperties := class allProperties size.

	self assert: numberOfProperties equals: expectedNumberOfProperties.
	self assert: numberOfProperties equals: 3
]

{ #category : 'tests' }
FM3ClassTest >> testAllPropertiesMoreThanProperties [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: element allProperties size > element properties size.
	self assert: element allProperties size equals: element properties size + element superclass properties size + element superclass superclass properties size.
	self assert: (element allProperties includesAll: element properties)
]

{ #category : 'tests' }
FM3ClassTest >> testAllPropertiesNotHot [
	| class prop size |
	class := metaMetamodel elementNamed: 'FM3.Class'.
	prop := class allProperties anyOne.
	size := class allProperties size.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class.
	self should: [ class allProperties remove: prop ] raise: Error.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class
]

{ #category : 'tests' }
FM3ClassTest >> testAllSuperclasses [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: element allSuperclasses isNotNil.
	self assert: element allSuperclasses isCollection.
	self assert: element allSuperclasses size equals: 3
]

{ #category : 'tests' }
FM3ClassTest >> testHasOwner [
	self assert: metaMetamodel classes anyOne hasOwner.
	self assert: metaMetamodel properties anyOne hasOwner.
	self deny: metaMetamodel packages anyOne hasOwner
]

{ #category : 'tests' }
FM3ClassTest >> testHasPackage [
	self assert: metaMetamodel classes anyOne hasPackage
]

{ #category : 'tests' }
FM3ClassTest >> testHasSuperclass [
	self assert: metaMetamodel classes anyOne hasSuperclass
]

{ #category : 'tests' }
FM3ClassTest >> testIsPrimitive [
	self deny: metaMetamodel classes anyOne isPrimitive
]

{ #category : 'tests' }
FM3ClassTest >> testIsRoot [
	self deny: metaMetamodel classes anyOne isRoot
]

{ #category : 'tests' }
FM3ClassTest >> testMetamodel [

	self assert: (metaMetamodel elementNamed: 'FM3.Class') metamodel equals: metaMetamodel
]

{ #category : 'tests' }
FM3ClassTest >> testProperties [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: element properties isNotNil.
	self assert: element properties isCollection.
	self denyEmpty: element properties
]

{ #category : 'tests' }
FM3ClassTest >> testPropertiesIsHot [
	| class prop size |
	"We use a new instance of FMMetaMetaModel since we will modify it."
	class := FMMetaMetaModel testMetaMetaModel elementNamed: 'FM3.Class'.
	prop := class properties anyOne.
	size := class properties size.
	self assert: class properties size equals: size.
	self assert: prop mmClass equals: class.
	class properties remove: prop.
	self assert: class properties size equals: size - 1.
	self assert: prop mmClass isNil
]

{ #category : 'tests' }
FM3ClassTest >> testPropertyNamed [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (element propertyNamed: #owner) isNotNil.
	self assert: (element propertyNamed: #abstract) isNotNil.
	self assert: (element propertyNamed: #zork) isNil
]

{ #category : 'tests' }
FM3ClassTest >> testPropertyNamedString [
	element := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (element propertyNamed: 'owner') isNotNil.
	self assert: (element propertyNamed: 'abstract') isNotNil.
	self assert: (element propertyNamed: 'zork') isNil
]

{ #category : 'tests' }
FM3ClassTest >> testSubclasses [
	self denyEmpty: (metaMetamodel elementNamed: 'FM3.Element') subclasses
]

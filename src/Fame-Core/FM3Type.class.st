Class {
	#name : #FM3Type,
	#superclass : #FM3Element,
	#instVars : [
		'package',
		'properties',
		'traits'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #meta }
FM3Type class >> annotation [
	<FMClass: #Type super: #FM3Element>
	<package: #FM3>

]

{ #category : #accessing }
FM3Type class >> defaultSuperclass [
	^ FM3Object instance
]

{ #category : #adding }
FM3Type >> addTraits: aCollection [
	self traits addAll: aCollection
]

{ #category : #enumerating }
FM3Type >> allPropertiesDo: block [
	properties do: block.
	self superclass ifNotNil: [ :class | class allPropertiesDo: block ].
	self traits do: [ :trait | trait allPropertiesDo: block ]
]

{ #category : #accessing }
FM3Type >> initialize [
	super initialize.
	properties := FMMultivalueLink on: self opposite: #mmClass:.
	traits := Set new
]

{ #category : #accessing }
FM3Type >> package [
	<FMProperty: #package type: #FM3Package opposite: #classes>
	<container>
	^ package
]

{ #category : #accessing }
FM3Type >> package: newPackage [
	package := FMMultivalueLink
		on: self
		update: #classes
		from: self package
		to: newPackage
]

{ #category : #accessing }
FM3Type >> properties [
	<FMProperty: #properties type: 'FM3.Property' opposite: #class>
	<multivalued>
	^ properties
]

{ #category : #accessing }
FM3Type >> properties: anObject [
	properties value: anObject
]

{ #category : #accessing }
FM3Type >> traits [
	<FMProperty: #traits type: #FM3Trait>
	<multivalued>
	^ traits
]

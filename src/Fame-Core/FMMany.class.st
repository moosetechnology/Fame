"
Description
--------------------

I am a relation slot representing a multivalued property.

Examples
--------------------

	Trait named: #FamixTWithMethods
		uses: {}
		slots: { #methods => FMMany type: #FamixTMethod opposite: #parentType }
		package: 'Famix-Traits-Method'
"
Class {
	#name : #FMMany,
	#superclass : #FMRelationSlot,
	#category : #'Fame-Core-Utilities'
}

{ #category : #internal }
FMMany >> add: newObject to: collectionOwner [
	self hasInverse ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ]
]

{ #category : #initialization }
FMMany >> initialize: anObject [
	self write: (FMSlotMultivalueLink on: anObject slot: self) to: anObject
]

{ #category : #internal }
FMMany >> remove: oldObject from: collectionOwner [

	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]

]

{ #category : #internal }
FMMany >> updateOld: oldValue new: newValue in: anObject [
	"We usually should not end up here, but it might appen if someone directly write an object in a FMMany instead of using #value:."

	^ anObject writeSlot: self value: newValue
]

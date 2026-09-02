"
I am an uninitialized relation.
When first accessed, I relsolved my loader block
"
Class {
	#name : 'FMLazyRelation',
	#superclass : 'Object',
	#instVars : [
		'loader'
	],
	#category : 'Fame-LazyRelations',
	#package : 'Fame-LazyRelations'
}

{ #category : 'accessing' }
FMLazyRelation class >> loader: aBlock [

	^ self new
		  loader: aBlock;
		  yourself
]

{ #category : 'accessing' }
FMLazyRelation class >> makeRelation: aSymbol of: anEntity lazyUsing: aBlock [

	| slot lazy |
	slot := anEntity class slotNamed: aSymbol.

	self assert: slot isFMRelationSlot.
	self assert: slot isToMany.

	lazy := self loader: aBlock.

	slot write: lazy to: anEntity.

	^ lazy
]

{ #category : 'accessing' }
FMLazyRelation >> fmValueReadFrom: aSlot owner: anObject [
    ^ self
        materializeFor: anObject
        slot: aSlot
]

{ #category : 'accessing' }
FMLazyRelation >> loader [

	^ loader
]

{ #category : 'accessing' }
FMLazyRelation >> loader: anObject [

	loader := anObject
]

{ #category : 'accessing' }
FMLazyRelation >> materializeFor: anObject slot: aSlot [

	| relation |
	relation := FMSlotMultivalueLink on: anObject slot: aSlot.

	loader value: relation value: anObject.

	aSlot write: relation to: anObject.

	^ relation
]

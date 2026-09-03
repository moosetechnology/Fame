Class {
	#name : 'FMLazyMany',
	#superclass : 'FMLazyValue',
	#category : 'Fame-LazyRelations',
	#package : 'Fame-LazyRelations'
}

{ #category : 'accessing' }
FMLazyMany >> materializeFor: anObject slot: aSlot [

	| relation |
	relation := FMSlotMultivalueLink on: anObject slot: aSlot.

	loader value: relation value: anObject.

	aSlot writeMaterialized: relation to: anObject.

	^ relation
]

"
I am an uninitialized relation.
When first accessed, I relsolved my loader block
"
Class {
	#name : 'FMLazyValue',
	#superclass : 'Object',
	#instVars : [
		'loader'
	],
	#category : 'Fame-LazyRelations',
	#package : 'Fame-LazyRelations'
}

{ #category : 'accessing' }
FMLazyValue class >> loader: aBlock [

	^ self new
		  loader: aBlock;
		  yourself
]

{ #category : 'accessing' }
FMLazyValue class >> makeRelation: aSymbol of: anEntity lazyUsing: aBlock [

	| slot lazy |
	slot := anEntity class slotNamed: aSymbol.

	self assert: slot isFMRelationSlot.
	lazy := slot isToOne
		        ifTrue: [ FMLazyOne loader: aBlock ]
		        ifFalse: [ FMLazyMany loader: aBlock ].

	slot writeMaterialized: lazy to: anEntity.

	^ lazy
]

{ #category : 'accessing' }
FMLazyValue >> fmValueReadFrom: aSlot owner: anObject [
    ^ self
        materializeFor: anObject
        slot: aSlot
]

{ #category : 'accessing' }
FMLazyValue >> loader [

	^ loader
]

{ #category : 'accessing' }
FMLazyValue >> loader: anObject [

	loader := anObject
]

{ #category : 'accessing' }
FMLazyValue >> materializeFor: anObject slot: aSlot [

	^ self subclassResponsibility
]

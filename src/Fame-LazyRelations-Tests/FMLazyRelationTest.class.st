Class {
	#name : 'FMLazyRelationTest',
	#superclass : 'TestCase',
	#category : 'Fame-LazyRelations-Tests',
	#package : 'Fame-LazyRelations-Tests'
}

{ #category : 'tests' }
FMLazyRelationTest >> testAccessMaterializesRelation [

	| entity slot loaded relation lazy |
	entity := RPGLazyHero new.
	slot := entity class slotNamed: #kills.

	loaded := false.

	lazy := FMLazyRelation loader: [ :relat :entit | loaded := true ].

	slot write: lazy to: entity.

	self deny: loaded.

	relation := entity kills.

	self assert: loaded.
	self assert: relation class equals: FMSlotMultivalueLink
]

{ #category : 'tests' }
FMLazyRelationTest >> testAddEntitiesInRelation [

	| entity slot relation lazy |
	entity := RPGLazyHero new.
	slot := entity class slotNamed: #kills.

	lazy := FMLazyRelation loader: [ :rel :entit |
		rel addAll:
		        {
			        RPGLazyDragon new.
			        RPGLazyDragon new } ].

	slot write: lazy to: entity.

	relation := entity kills.

	self assert: relation size equals: 2.
	self assert: relation anyOne killedBy anyOne equals: entity
]

{ #category : 'tests' }
FMLazyRelationTest >> testAddToLazyRelation [

	| entity dragon |
	entity := RPGLazyHero new.

	FMLazyRelation
		makeRelation: #kills
		of: entity
		lazyUsing: [ :rel :entit |
			rel addAll: {
					RPGLazyDragon new.
					RPGLazyDragon new } ].

	dragon := RPGLazyDragon new.

	dragon killedBy: { entity }.

	self assert: dragon killedBy size equals: 1.
	self assert: dragon killedBy anyOne equals: entity.
	self assert: entity kills size equals: 3.
	self assert: entity kills last identicalTo: dragon.
	
]

{ #category : 'tests' }
FMLazyRelationTest >> testByPassByDirectlyAdding [

	| entity dragon |
	entity := RPGLazyHero new.

	FMLazyRelation
		makeRelation: #kills
		of: entity
		lazyUsing: [ :rel :entit |
			rel addAll: {
					RPGLazyDragon new.
					RPGLazyDragon new } ].

	dragon := RPGLazyDragon new.


	entity kills: { dragon }.

	self assert: entity kills size equals: 1.
	self assert: entity kills anyOne identicalTo: dragon
	
]

{ #category : 'tests' }
FMLazyRelationTest >> testDefaultBehavior [

	| entity dragon |
	entity := RPGLazyHero new.
	dragon := RPGLazyDragon new.
	dragon killedBy: { entity }.

	self assert: dragon killedBy size equals: 1.
	self assert: dragon killedBy anyOne equals: entity.
	self assert: entity kills size equals: 1.
	self assert: entity kills anyOne equals: dragon.
	
]

{ #category : 'tests' }
FMLazyRelationTest >> testRelationIsLoadedOnlyOnce [

	| entity count first second |
	entity := RPGLazyHero new.
	count := 0.

	FMLazyRelation
		makeRelation: #kills
		of: entity
		lazyUsing: [ :relation :entit | count := count + 1 ].

	first := entity kills.
	second := entity kills.

	self assert: count equals: 1.
	self assert: first identicalTo: second
]

{ #category : 'tests' }
FMLazyRelationTest >> testRelationIsNotAppliedToAllEntities [

	| entity entity2 count first second first2 |
	entity := RPGLazyHero new.
	entity2 := RPGLazyHero new.
	count := 0.

	FMLazyRelation
		makeRelation: #kills
		of: entity
		lazyUsing: [ :relation :entit | count := count + 1 ].

	first := entity kills.
	second := entity kills.
	
	first2 := entity2 kills.

	self assert: count equals: 1.
	self assert: first identicalTo: second
]

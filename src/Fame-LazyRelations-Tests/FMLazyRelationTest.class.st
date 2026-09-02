Class {
	#name : 'FMLazyRelationTest',
	#superclass : 'TestCase',
	#category : 'Fame-LazyRelations-Tests',
	#package : 'Fame-LazyRelations-Tests'
}

{ #category : 'tests' }
FMLazyRelationTest >> testAccessMaterializesRelation [

	| entity loaded relation |
	entity := RPGLazyHero new.

	loaded := false.
	FMLazyValue
		makeRelation: #kills
		of: entity
		lazyUsing: [ :rel :entit | loaded := true ].

	self deny: loaded.

	relation := entity kills.

	self assert: loaded.
	self assert: relation class equals: FMSlotMultivalueLink
]

{ #category : 'tests' }
FMLazyRelationTest >> testAddEntitiesInRelation [

	| entity relation |
	entity := RPGLazyHero new.

	FMLazyValue
		makeRelation: #kills
		of: entity
		lazyUsing: [ :rel :entit |
			rel addAll: {
					RPGLazyDragon new.
					RPGLazyDragon new } ].

	relation := entity kills.

	self assert: relation size equals: 2.
	self assert: relation anyOne killedBy anyOne equals: entity
]

{ #category : 'tests' }
FMLazyRelationTest >> testAddToLazyRelation [

	| entity dragon |
	entity := RPGLazyHero new.

	FMLazyValue
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

	FMLazyValue
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
FMLazyRelationTest >> testManyToOneWithlazyOne [

	| entity hero hero2 |
	self flag: #currentLimitation.
	"entity := RPGLazyTalisman new.
	hero := RPGLazyHero new.
	hero2 := RPGLazyHero new.

	FMLazyValue
		makeRelation: #owner
		of: entity
		lazyUsing: [ :rel :entit | rel value: hero ].
	hero2 talismans: { entity }.
	self assert: entity owner identicalTo: hero2.
	self assert: hero talismans size equals: 0.
	self assert: hero2 talismans anyOne identicalTo: entity"
]

{ #category : 'tests' }
FMLazyRelationTest >> testOneToManyRelation [

    | entity hero |

    entity := RPGLazyTalisman new.
    hero := RPGLazyHero new.

    FMLazyValue
        makeRelation: #owner
        of: entity
        lazyUsing: [ :rel :entit |
            rel value: hero ].

    self assert: entity owner identicalTo: hero.
    self assert: hero talismans size equals: 1.
    self assert: hero talismans anyOne identicalTo: entity.
]

{ #category : 'tests' }
FMLazyRelationTest >> testOneToManyRelationTwiceCalled [

	| entity hero count |
	entity := RPGLazyTalisman new.
	hero := RPGLazyHero new.
	count := 0.

	FMLazyValue
		makeRelation: #owner
		of: entity
		lazyUsing: [ :rel :entit |
			count := count + 1.
			rel value: hero ].
	entity owner.
	entity owner.

	self assert: count equals: 1
]

{ #category : 'tests' }
FMLazyRelationTest >> testOneToOneRelation [

	| weapon hero |
	weapon := RPGLazyUniqueWeapon new.
	hero := RPGLazyHero new.

	FMLazyValue
		makeRelation: #owner
		of: weapon
		lazyUsing: [ :rel :entit | rel value: hero ].

	self assert: weapon owner identicalTo: hero
]

{ #category : 'tests' }
FMLazyRelationTest >> testOneToOneRelationReverse [

	| weapon weapon2 hero |
	self flag: #currentLimitation.
	"weapon := RPGLazyUniqueWeapon new.
	hero := RPGLazyHero new.
	weapon2 := RPGLazyUniqueWeapon new.

	FMLazyValue
		makeRelation: #owner
		of: weapon
		lazyUsing: [ :rel :entit | rel value: hero ].
	
	hero uniqueWeapon: weapon2.

	self assert: hero uniqueWeapon identicalTo: weapon2.
	self assert: weapon owner isNil."
]

{ #category : 'tests' }
FMLazyRelationTest >> testRelationIsLoadedOnlyOnce [

	| entity count first second |
	entity := RPGLazyHero new.
	count := 0.

	FMLazyValue
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

	FMLazyValue
		makeRelation: #kills
		of: entity
		lazyUsing: [ :relation :entit | count := count + 1 ].

	first := entity kills.
	second := entity kills.
	
	first2 := entity2 kills.

	self assert: count equals: 1.
	self assert: first identicalTo: second
]

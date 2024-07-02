"
This class is complementary with the tests in `FMDungeonExample`
"
Class {
	#name : #FMMultiMultivalueLinkTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMultiMultivalueLinkTest >> testCollect [

	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { dragon1 }.
	self
		assert: (hero1 kills collect: [ :dragon | dragon ])
		equals: { dragon1 } asOrderedCollection
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testCollectThenSelect [

	| dragon1 dragon2 hero1 treasure1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	treasure1 := RPGTreasure new.
	dragon1 hoard: { treasure1 }.
	hero1 kills: {
			dragon1.
			dragon2 }.
	self
		assertCollection: (hero1 kills
				 collect: [ :dragon | dragon hoard asArray ]
				 thenSelect: [ :hoard | hoard isNotEmpty ])
		hasSameElements: { { treasure1 } }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneDragonIsKilledByOneHero [

	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	dragon1 killedBy: { hero1 }.
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillOneDragon [

	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { dragon1 }.
	self assert: hero1 kills size equals: 1.
	self assert: hero1 kills anyOne equals: dragon1
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillOneDragonThenTheDragonDecideToNotBeKilled [

	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { dragon1 }.
	dragon1 killedBy: {  }.
	self assert: hero1 kills size equals: 0.
	self assert: dragon1 killedBy size equals: 0
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillOneDragonsThenTwoWithTheFirstOneAgain [

	| dragon1 dragon2 hero1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { dragon1 }.
	hero1 kills: { 
			dragon1.
			dragon2 }.
	self assert: hero1 kills size equals: 2.
	self assertCollection: hero1 kills hasSameElements: { 
			dragon1.
			dragon2 }.

	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon2 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1.
	self assert: dragon2 killedBy anyOne equals: hero1
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillTwiceTheSameDragon [

	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon1 }.
	self assert: hero1 kills size equals: 1.
	self assert: hero1 kills anyOne equals: dragon1.
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillTwoDragons [

	| dragon1 dragon2 hero1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon2 }.
	self assert: hero1 kills size equals: 2.
	self assertCollection: hero1 kills hasSameElements: { 
			dragon1.
			dragon2 }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKillTwoDragonsAndFinallyOnlyOne [

	| dragon1 dragon2 hero1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon2 }.
	hero1 kills: { dragon1 }.
	self assert: hero1 kills size equals: 1.
	self assertCollection: hero1 kills hasSameElements: { dragon1 }.
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1.
	self assert: dragon2 killedBy size equals: 0
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneHeroKilledLotOfDragon [

	"This is a performance test"

	| dragons hero1 |
	dragons := OrderedCollection new.
	1 to: 50000 do: [ :index | dragons add: RPGDragon new ].
	hero1 := RPGHero new.
	hero1 kills: dragons.
	self assert: hero1 kills size equals: 50000.
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testReject [

	| dragon1 dragon2 hero1 treasure1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	treasure1 := RPGTreasure new.
	dragon1 hoard: { treasure1 }.
	hero1 kills: {
			dragon1.
			dragon2 }.
	self
		assert: (hero1 kills reject: [ :dragon | dragon hoard isNotEmpty ])
		equals: { dragon2 } asOrderedCollection.
	self
		assert: (hero1 kills reject: [ :dragon | dragon hoard isEmpty ])
		equals: { dragon1 } asOrderedCollection
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testRejectThenCollect [

	| dragon1 dragon2 hero1 treasure1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	treasure1 := RPGTreasure new.
	dragon1 hoard: { treasure1 }.
	hero1 kills: {
			dragon1.
			dragon2 }.
	self
		assert: (hero1 kills
				 reject: [ :dragon | dragon hoard isEmpty ]
				 thenCollect: [ :dragon | dragon hoard anyOne ])
		equals: { treasure1 } asOrderedCollection
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testSelect [

	| dragon1 dragon2 hero1 treasure1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	treasure1 := RPGTreasure new.
	dragon1 hoard: { treasure1 }.
	hero1 kills: {
			dragon1.
			dragon2 }.
	self
		assert: (hero1 kills select: [ :dragon | dragon hoard isNotEmpty ])
		equals: { dragon1 } asOrderedCollection.
	self
		assert: (hero1 kills select: [ :dragon | dragon hoard isEmpty ])
		equals: { dragon2 } asOrderedCollection
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testSelectThenCollect [

	| dragon1 dragon2 hero1 treasure1 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	treasure1 := RPGTreasure new.
	dragon1 hoard: { treasure1 }.
	hero1 kills: {
			dragon1.
			dragon2 }.
	self
		assert: (hero1 kills
				 select: [ :dragon | dragon hoard isNotEmpty ]
				 thenCollect: [ :dragon | dragon hoard anyOne ])
		equals: { treasure1 } asOrderedCollection
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoDragonsAreKilledByOneHero [

	| dragon1 hero1 dragon2 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	dragon1 killedBy: { hero1 }.
	dragon2 killedBy: { hero1 }.
	"From dragon to hero relation"
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1.
	self assert: dragon2 killedBy size equals: 1.
	self assert: dragon2 killedBy anyOne equals: hero1.
	"From hero to dragon relation"
	self assert: hero1 kills size equals: 2.
	self assertCollection: hero1 kills hasSameElements: { 
			dragon1.
			dragon2 }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoDragonsAreKilledByTwoHeros [

	| dragon1 hero1 dragon2 hero2 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	hero2 := RPGHero new.
	dragon1 killedBy: { 
			hero1.
			hero2 }.
	dragon2 killedBy: { 
			hero1.
			hero2 }.
	self assert: dragon1 killedBy size equals: 2.
	self assertCollection: dragon1 killedBy hasSameElements: { 
			hero1.
			hero2 }.
	self assert: dragon2 killedBy size equals: 2.
	self assertCollection: dragon2 killedBy hasSameElements: { 
			hero1.
			hero2 }.
	"From hero to dragon relation"
	self assert: hero1 kills size equals: 2.
	self assert: hero2 kills size equals: 2.
	self assertCollection: hero1 kills hasSameElements: { 
			dragon1.
			dragon2 }.
	self assertCollection: hero2 kills hasSameElements: { 
			dragon1.
			dragon2 }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoHerosKillTWiceTwoDragons [

	| dragon1 dragon2 hero1 hero2 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	hero2 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon1.
			dragon2.
			dragon2 }.
	hero2 kills: { 
			dragon1.
			dragon1.
			dragon2.
			dragon2 }.
	self assert: hero1 kills size equals: 2.
	self assert: hero1 kills anyOne equals: dragon1.
	self assert: hero2 kills size equals: 2.
	self assert: hero2 kills anyOne equals: dragon1.
	self assert: dragon1 killedBy size equals: 2.
	self assertCollection: dragon1 killedBy hasSameElements: { 
			hero1.
			hero2 }.
	self assert: dragon2 killedBy size equals: 2.
	self assertCollection: dragon2 killedBy hasSameElements: { 
			hero1.
			hero2 }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoHerosKillThriceTheSameDragon [

	| dragon1 hero1 hero2 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero2 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon1 }.
	hero1 kills add: dragon1.
	hero2 kills: { 
			dragon1.
			dragon1 }.
	hero2 kills add: dragon1.
	self assert: hero1 kills size equals: 1.
	self assert: hero1 kills anyOne equals: dragon1.
	self assert: hero2 kills size equals: 1.
	self assert: hero2 kills anyOne equals: dragon1.
	self assert: dragon1 killedBy size equals: 2.
	self assertCollection: dragon1 killedBy hasSameElements: { 
			hero1.
			hero2 }
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoHerosKillTwiceTheSameDragon [

	| dragon1 hero1 hero2 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	hero2 := RPGHero new.
	hero1 kills: { 
			dragon1.
			dragon1 }.
	hero2 kills: { 
			dragon1.
			dragon1 }.
	self assert: hero1 kills size equals: 1.
	self assert: hero1 kills anyOne equals: dragon1.
	self assert: hero2 kills size equals: 1.
	self assert: hero2 kills anyOne equals: dragon1.
	self assert: dragon1 killedBy size equals: 2.
	self assertCollection: dragon1 killedBy hasSameElements: { 
			hero1.
			hero2 }
]

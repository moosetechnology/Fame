Class {
	#name : #FMMultiMultivalueLinkTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMultiMultivalueLinkTest >> testOneDragonIsKilledByOneHero [
	| dragon1 hero1 |
	dragon1 := RPGDragon new.
	hero1 := RPGHero new.
	dragon1 killedBy: { hero1 }.
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1.
]

{ #category : #tests }
FMMultiMultivalueLinkTest >> testTwoDragonsAreKilledByOneHero [
	| dragon1 hero1 dragon2 |
	dragon1 := RPGDragon new.
	dragon2 := RPGDragon new.
	hero1 := RPGHero new.
	dragon1 killedBy: { hero1 }.
	dragon2 killedBy: { hero1 }.
	self assert: dragon1 killedBy size equals: 1.
	self assert: dragon1 killedBy anyOne equals: hero1.
	self assert: dragon2 killedBy size equals: 1.
	self assert: dragon2 killedBy anyOne equals: hero1.
]

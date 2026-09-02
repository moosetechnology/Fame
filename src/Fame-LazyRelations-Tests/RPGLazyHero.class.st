Class {
	#name : 'RPGLazyHero',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#kills => FMMany type: #RPGLazyDragon opposite: #killedBy'
	],
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'accessing' }
RPGLazyHero >> kills [

	^ kills
]

{ #category : 'accessing' }
RPGLazyHero >> kills: anObject [

	kills := anObject
]

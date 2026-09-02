Class {
	#name : 'RPGLazyHero',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#kills => FMMany type: #RPGLazyDragon opposite: #killedBy',
		'#talismans => FMMany type: #RPGLazyTalisman opposite: #owner'
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
	"value when multimulti relation"

	kills value: anObject
]

{ #category : 'accessing' }
RPGLazyHero >> talismans [

	^ talismans
]

{ #category : 'accessing' }
RPGLazyHero >> talismans: anObject [

	talismans := anObject
]

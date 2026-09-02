Class {
	#name : 'RPGLazyDragon',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#killedBy => FMMany type: #RPGLazyHero opposite: #kills'
	],
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'accessing' }
RPGLazyDragon >> killedBy [

	^ killedBy
]

{ #category : 'accessing' }
RPGLazyDragon >> killedBy: anObject [

	killedBy := anObject
]

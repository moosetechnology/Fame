Class {
	#name : 'RPGLazyTaslisman',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#owner => FMOne type: #RPGLazyHero opposite: #talismans'
	],
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'accessing' }
RPGLazyTaslisman >> owner [

	^ owner
]

{ #category : 'accessing' }
RPGLazyTaslisman >> owner: anObject [

	owner := anObject
]

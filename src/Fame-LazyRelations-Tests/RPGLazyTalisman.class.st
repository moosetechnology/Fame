Class {
	#name : 'RPGLazyTalisman',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#owner => FMOne type: #RPGLazyHero opposite: #talismans'
	],
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'accessing' }
RPGLazyTalisman >> owner [

	^ owner
]

{ #category : 'accessing' }
RPGLazyTalisman >> owner: anObject [

	owner := anObject
]

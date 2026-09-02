Class {
	#name : 'RPGLazyUniqueWeapon',
	#superclass : 'RPGLazyEntity',
	#instVars : [
		'#owner => FMOne type: #RPGLazyHero opposite: #uniqueWeapon'
	],
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'accessing' }
RPGLazyUniqueWeapon >> owner [

	^ owner
]

{ #category : 'accessing' }
RPGLazyUniqueWeapon >> owner: anObject [

	owner := anObject
]

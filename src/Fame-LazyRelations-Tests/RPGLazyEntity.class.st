Class {
	#name : 'RPGLazyEntity',
	#superclass : 'Object',
	#category : 'Fame-LazyRelations-Tests-Example',
	#package : 'Fame-LazyRelations-Tests',
	#tag : 'Example'
}

{ #category : 'initialization' }
RPGLazyEntity >> initialize [

	super initialize.
	self class initializeSlots: self
]

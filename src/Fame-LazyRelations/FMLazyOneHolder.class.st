Class {
	#name : 'FMLazyOneHolder',
	#superclass : 'Object',
	#instVars : [
		'val'
	],
	#category : 'Fame-LazyRelations',
	#package : 'Fame-LazyRelations'
}

{ #category : 'accessing' }
FMLazyOneHolder >> value [

	^ val
]

{ #category : 'accessing' }
FMLazyOneHolder >> value: anObject [

	val := anObject
]

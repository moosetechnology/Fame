Class {
	#name : 'FM3TraitConstant',
	#superclass : 'FM3Constant',
	#category : 'Fame-Core-Model',
	#package : 'Fame-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
FM3TraitConstant class >> constantName [
	^ #Trait
]

{ #category : 'accessing-query' }
FM3TraitConstant class >> defaultSuperclass [
	^ nil
]

{ #category : 'testing' }
FM3TraitConstant >> isRoot [
	^ true
]

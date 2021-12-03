"
I am a virtual slot. 
I use the expected slot name as configuration. 
I am polymorphic with the relation slots.
I delegate to the accessors that should be implemented by the target object.
"
Class {
	#name : #FMVirtualSlot,
	#superclass : #Object,
	#instVars : [
		'setter',
		'getter'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #writing }
FMVirtualSlot >> read: anObject [

	^ anObject perform: getter withArguments: {  }
]

{ #category : #internal }
FMVirtualSlot >> reverseAddAssociationFrom: aGeneratedTestCaseMyMethod to: anObject [

	self write: aGeneratedTestCaseMyMethod to: anObject
]

{ #category : #initialization }
FMVirtualSlot >> slotName: aName [
	getter := aName asSymbol.
	setter := (aName , ':') asSymbol
]

{ #category : #writing }
FMVirtualSlot >> write: aGeneratedTestCaseMyMethod to: anObject [

	^ anObject
		  perform: setter
		  withArguments: { aGeneratedTestCaseMyMethod }
]

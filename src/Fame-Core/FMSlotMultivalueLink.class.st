"
Description
--------------------

I am a class meant to be used as an internal of a FMMany slot.

I'll be wrapped by the slot and manage the content of the many slot.
"
Class {
	#name : 'FMSlotMultivalueLink',
	#superclass : 'OrderedCollection',
	#instVars : [
		'owner',
		'slot'
	],
	#category : 'Fame-Core-Utilities',
	#package : 'Fame-Core',
	#tag : 'Utilities'
}

{ #category : 'instance creation' }
FMSlotMultivalueLink class >> new [

	^ self new: 4
]

{ #category : 'instance creation' }
FMSlotMultivalueLink class >> on: anObject slot: aFMRelationSlot [

	^ self new owner: anObject slot: aFMRelationSlot

]

{ #category : 'adding' }
FMSlotMultivalueLink >> addLast: anElement [

	slot add: anElement to: owner.
	self unsafeAdd: anElement.
	^ anElement
]

{ #category : 'converting' }
FMSlotMultivalueLink >> asOrderedCollection [

	^ OrderedCollection newFrom: self
]

{ #category : 'accessing' }
FMSlotMultivalueLink >> byName: name [

	^ self byName: name ifAbsent: [ self errorNotFound: name ]
]

{ #category : 'accessing' }
FMSlotMultivalueLink >> byName: name ifAbsent: exceptionBlock [

	^ self
		  detect: [ :each | each name asString = name asString ]
		  ifNone: exceptionBlock
]

{ #category : 'accessing' }
FMSlotMultivalueLink >> byName: name ifPresent: aBlock ifAbsent: exceptionBlock [

	^ self
		  detect: [ :each | each name asString = name asString ]
		  ifFound: aBlock
		  ifNone: exceptionBlock
]

{ #category : 'private' }
FMSlotMultivalueLink >> owner: anObject slot: aFMRelationSlot [

	owner := anObject.
	slot := aFMRelationSlot
]

{ #category : 'removing' }
FMSlotMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [

	super remove: anElement ifAbsent: [ ^ exceptionBlock value ].
	slot remove: anElement from: owner.
	^ anElement
]

{ #category : 'removing' }
FMSlotMultivalueLink >> removeAll [
	"The collection is reversed to make a copy, to avoid trying to remove while iterating,
	and to remove items from last to first, which is faster."

	self reversed do: [ :anElement | self remove: anElement ]
]

{ #category : 'private' }
FMSlotMultivalueLink >> species [

	^ OrderedCollection
]

{ #category : 'adding' }
FMSlotMultivalueLink >> uncheckUnsafeAdd: element [
	"Calls the implementation in OrderedCollection."

	super addLast: element
]

{ #category : 'private' }
FMSlotMultivalueLink >> unsafeAdd: element [
	"The cost of this #includes can be pretty high so there is a way to disable it when we know there will be no duplicates. Check the class comment of the dynamic variable."

	FMShouldCheckForDuplicatedEntitiesInMultivalueLinks value
		ifTrue: [ (self includes: element) ifFalse: [ self uncheckUnsafeAdd: element ] ]
		ifFalse: [ self uncheckUnsafeAdd: element ]
]

{ #category : 'private' }
FMSlotMultivalueLink >> unsafeRemove: element [

	super remove: element ifAbsent: nil
]

{ #category : 'accessing' }
FMSlotMultivalueLink >> value: aCollection [

	^ self
		  removeAll;
		  addAll: aCollection
]

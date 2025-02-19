"
A FMMultivalueLink is an implementation for relationships that upate the backlink and
updates the opposite link in a one to many way.

Imagine that we want to have a Book with Sections

Book
    sections

Book>>initialize

	...
	sections := FMMultivalueLink on: self opposite: #book: 

means that sections is a kind of Collection in which when a new element is added
the message book: with self is sent.

This means each time a new element is added the backlink is managed automatically.

Now when the book of a Section is changed, 

Section>>book: aBook
	book := FMMultivalueLink on: self
					update: #sections
					from: self book
					to: aBook
					
This message make sure that if a book is changed, the sections
that refers to it are updated accordingly.


"
Class {
	#name : #FMMultivalueLink,
	#superclass : #OrderedCollection,
	#instVars : [
		'owner',
		'opposite'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #'instance creation' }
FMMultivalueLink class >> new [

	^ self new: 0
]

{ #category : #'instance creation' }
FMMultivalueLink class >> on: element opposite: oppositeSelector [
	^ self new
		with: element opposite: oppositeSelector;
		yourself
]

{ #category : #'instance creation' }
FMMultivalueLink class >> on: element update: selector from: old to: new [
	"refresh the other side of the relations to reflect change in value"

	old ~= new ifTrue: [
		old ifNotNil: [ (old perform: selector) unsafeRemove: element ].
		new ifNotNil: [ (new perform: selector) unsafeAdd: element ] ].
	^ new
]

{ #category : #adding }
FMMultivalueLink >> addLast: anElement [

	self addOpposite: anElement.
	self unsafeAdd: anElement.
	^ anElement
]

{ #category : #adding }
FMMultivalueLink >> addOpposite: anElement [

	anElement perform: opposite with: owner
]

{ #category : #converting }
FMMultivalueLink >> asOrderedCollection [

	^ OrderedCollection newFrom: self
]

{ #category : #accessing }
FMMultivalueLink >> byName: name [

	^ self byName: name ifAbsent: [ self errorNotFound: name ]
]

{ #category : #accessing }
FMMultivalueLink >> byName: name ifAbsent: exceptionBlock [

	^ self
		  detect: [ :each | each name asString = name asString ]
		  ifNone: exceptionBlock
]

{ #category : #accessing }
FMMultivalueLink >> byName: name ifPresent: aBlock ifAbsent: exceptionBlock [

	^ self
		  detect: [ :each | each name asString = name asString ]
		  ifFound: aBlock
		  ifNone: exceptionBlock
]

{ #category : #printing }
FMMultivalueLink >> printOn: aStream [

	self asArray printOn: aStream
]

{ #category : #removing }
FMMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [

	super remove: anElement ifAbsent: [ ^ exceptionBlock value ].
	self removeOpposite: anElement.
	^ anElement
]

{ #category : #removing }
FMMultivalueLink >> removeAll [
	"The collection is reversed to make a copy, to avoid trying to remove while iterating,
	and to remove items from last to first, which is faster."

	self reversed do: [ :anElement | self remove: anElement ]
]

{ #category : #removing }
FMMultivalueLink >> removeOpposite: anElement [

	anElement perform: opposite with: nil
]

{ #category : #private }
FMMultivalueLink >> species [

	^ OrderedCollection
]

{ #category : #private }
FMMultivalueLink >> uncheckUnsafeAdd: element [
	"Calls the implementation in OrderedCollection."

	super addLast: element
]

{ #category : #private }
FMMultivalueLink >> unsafeAdd: element [

	(self includes: element) ifFalse: [ super addLast: element ]
]

{ #category : #private }
FMMultivalueLink >> unsafeRemove: element [

	super remove: element ifAbsent: nil
]

{ #category : #adding }
FMMultivalueLink >> value: aCollection [

	^ self
		  removeAll;
		  addAll: aCollection
]

{ #category : #private }
FMMultivalueLink >> with: element opposite: oppositeSelector [

	self assert: oppositeSelector numArgs = 1.
	owner := element.
	opposite := oppositeSelector
]

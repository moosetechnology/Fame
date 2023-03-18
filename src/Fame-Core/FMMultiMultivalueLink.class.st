"
A FMMultiMultivalueLink is an implementation for relationships that updates the opposite link
in a many to many way.

LIBPerson>>initialize
	...
	books := FMMultiMultivalueLink on: self opposite: #authors.
	
LIBPerson>>books: aBookCollection
	books value: aBook

will maintain the link when the books collection changes

LIBBook>>initialize
	...
	authors := FMMultiMultivalueLink on: self opposite: #books.
	
LIBBook>>authors: persons
	authors value: persons
"
Class {
	#name : #FMMultiMultivalueLink,
	#superclass : #FMMultivalueLink,
	#category : #'Fame-Core-Utilities'
}

{ #category : #adding }
FMMultiMultivalueLink >> add: anElement [
	(anElement perform: opposite) unsafeAdd: owner.
	(values includes: anElement) ifFalse: [ values add: anElement ].
	^ anElement
]

{ #category : #removing }
FMMultiMultivalueLink >> remove: anElement ifAbsent: exceptionBlock [ 
	
	values remove: anElement ifAbsent: [ ^exceptionBlock value ].
	(anElement perform: opposite) unsafeRemove: owner.
	^anElement
]

{ #category : #removing }
FMMultiMultivalueLink >> removeAll [
	values reversed
		do: [ :anElement | (anElement perform: opposite) remove: owner ]
]

{ #category : #'private - adding' }
FMMultiMultivalueLink >> uncheckAdd: anElement [ 
	(anElement perform: opposite) uncheckUnsafeAdd: owner.
	values add: anElement.
	^ anElement
]

{ #category : #'private - adding' }
FMMultiMultivalueLink >> uncheckAddAll: aCollection [ 
	"Include all the elements of aCollection as the receiver's elements. Answer 
	aCollection. Actually, any object responding to #do: can be used as argument."
	aCollection do: [ :each | self uncheckAdd: each ].
	^ aCollection
]

{ #category : #'private - adding' }
FMMultiMultivalueLink >> uncheckUnsafeAdd: element [ 
	values add: element
]

{ #category : #adding }
FMMultiMultivalueLink >> value: aCollection [

	^ self
		  removeAll: values copy;
		  uncheckAddAll: aCollection asOrderedCollection removeDuplicates
]

{ #category : #private }
FMMultiMultivalueLink >> with: element opposite: oppositeSelector [
	self assert: oppositeSelector numArgs = 0.
	values := OrderedCollection new.
	owner := element.
	opposite := oppositeSelector
]

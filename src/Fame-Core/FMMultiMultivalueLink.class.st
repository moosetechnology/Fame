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
FMMultiMultivalueLink >> addOpposite: anElement [

	(anElement perform: opposite) unsafeAdd: owner
]

{ #category : #removing }
FMMultiMultivalueLink >> removeOpposite: anElement [

	(anElement perform: opposite) unsafeRemove: owner
]

{ #category : #'private - adding' }
FMMultiMultivalueLink >> uncheckAdd: anElement [

	(anElement perform: opposite) uncheckUnsafeAdd: owner.
	self uncheckUnsafeAdd: anElement.
	^ anElement
]

{ #category : #'private - adding' }
FMMultiMultivalueLink >> uncheckAddAll: aCollection [
	"Include all the elements of aCollection as the receiver's elements. Answer 
	aCollection. Actually, any object responding to #do: can be used as argument."

	aCollection do: [ :each | self uncheckAdd: each ].
	^ aCollection
]

{ #category : #adding }
FMMultiMultivalueLink >> value: aCollection [

	^ self
		  removeAll;
		  "We want unique elements and to keep the order, but `removeDuplicates` is really slow."
		  uncheckAddAll: (aCollection
				   collect: [ :element | element -> nil ]
				   as: OrderedDictionary) keys
]

{ #category : #private }
FMMultiMultivalueLink >> with: element opposite: oppositeSelector [

	self assert: oppositeSelector numArgs = 0.
	self setContents: #(  ).
	owner := element.
	opposite := oppositeSelector
]

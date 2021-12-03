Class {
	#name : #FM3RelationSlotTestCase,
	#superclass : #TestCase,
	#instVars : [
		'testingClass',
		'testingMethod',
		'testingConvenientClass'
	],
	#category : #'Fame-Tests-Slots'
}

{ #category : #adding }
FM3RelationSlotTestCase >> addMethod: aGeneratedTestCaseMyMethod to: aGeneratedTestCaseMyClass [

	(self getMethods: aGeneratedTestCaseMyClass) add:
		aGeneratedTestCaseMyMethod
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> classSlot [

	^ testingMethod allSlots detect: [ :a | a name = #sclass ]
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getClass: aGeneratedTestCaseMyMethod [

	^ self classSlot read: aGeneratedTestCaseMyMethod
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getMethodFromThatThing: aGeneratedTestCaseMyThingThatHasOneMethod [

	^ self methodThingSlot read:
		  aGeneratedTestCaseMyThingThatHasOneMethod
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getMethods: aGeneratedTestCaseMyClass [

	^ self methodsSlot read: aGeneratedTestCaseMyClass
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getSubClasses: aGeneratedTestCaseMyClass [

	^ self subclassesSlot read: aGeneratedTestCaseMyClass
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getSuperClass: aGeneratedTestCaseMyClass [

	^ self superClassSlot read: aGeneratedTestCaseMyClass
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getThatThing: aGeneratedTestCaseMyMethod [ 
	^ self thatThingSlot read: aGeneratedTestCaseMyMethod
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> methodThingSlot [

	^ testingConvenientClass allSlots detect: [ :s | s name = #method ]
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> methodsSlot [

	^ testingClass allSlots detect: [ :a | a name = #methods ]
]

{ #category : #'instance creation' }
FM3RelationSlotTestCase >> newConvenientThatThing [

	| entry |
	entry := testingConvenientClass new.
	testingConvenientClass initializeSlots: entry.
	^ entry
]

{ #category : #'instance creation' }
FM3RelationSlotTestCase >> newTestingClass [

	| entry |
	entry := testingClass new.
	testingClass initializeSlots: entry.
	^ entry
]

{ #category : #'instance creation' }
FM3RelationSlotTestCase >> newTestingMethod [
	| entry |
	entry := testingMethod new.
	testingMethod initializeSlots: entry.
	^ entry
]

{ #category : #initialization }
FM3RelationSlotTestCase >> setSuperClass: aGeneratedTestCaseMyClass to: aGeneratedTestCaseMyClass2 [ 
	self superClassSlot write: aGeneratedTestCaseMyClass2 to: aGeneratedTestCaseMyClass
]

{ #category : #initialization }
FM3RelationSlotTestCase >> setThatThing: aGeneratedTestCaseMyThingThatHasOneMethod to: aGeneratedTestCaseMyMethod [

	self thatThingSlot
		write: aGeneratedTestCaseMyThingThatHasOneMethod
		to: aGeneratedTestCaseMyMethod
]

{ #category : #initialization }
FM3RelationSlotTestCase >> setUp [

	testingClass := ((Object << #GeneratedTestCaseMyClass)
		                 slots: { 
				                 (#sclass => FMOne
					                  type: #GeneratedTestCaseMyClass
					                  opposite: #subclasses).
				                 (#subclasses => FMMany
					                  type: #GeneratedTestCaseMyClass
					                  opposite: #sclass).
				                 (#methods => FMMany
					                  type: #GeneratedTestCaseMyMethod
					                  opposite: #sclass) };
		                 tag: 'Slots';
		                 package: 'Fame-Tests-Generated') install.
	testingMethod := ((Object << #GeneratedTestCaseMyMethod)
		                  slots: { 
				                  (#sclass => FMOne
					                   type: #GeneratedTestCaseMyClass
					                   opposite: #methods).
				                  (#thatThing => FMOne
					                   type:
						                   #GeneratedTestCaseMyThingThatHasOneMethod
					                   opposite: #method) };
		                  tag: 'Slots';
		                  package: 'Fame-Tests-Generated') build.
	testingConvenientClass := ((Object
	                            <<
		                            #GeneratedTestCaseMyThingThatHasOneMethod)
		                           slots: { (#method => FMOne
				                            type: #GeneratedTestCaseMyMethod
				                            opposite: #thatThing) };
		                           tag: 'Slots';
		                           package: 'Fame-Tests-Generated') build
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> subclassesSlot [

	^ testingClass allSlots detect: [ :s | s name = #subclasses ]
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> superClassSlot [

	^ testingClass allSlots detect: [ :s | s name = #sclass ]
]

{ #category : #initialization }
FM3RelationSlotTestCase >> testSetSuperClassAddsSubclass [

	| superclass subclass |
	superclass := self newTestingClass.

	subclass := self newTestingClass.

	self assert: (self getSuperClass: subclass) isNil.
	self assert: (self getSuperClass: superclass) isNil.

	self assert: (self getSubClasses: subclass) isEmpty.
	self assert: (self getSubClasses: superclass) isEmpty.

	self setSuperClass: subclass to: superclass.

	self assert: (self getSuperClass: subclass) equals: superclass.
	self assert: (self getSuperClass: superclass) isNil.

	self assert: (self getSubClasses: superclass) size equals: 1.
	self assert: (self getSubClasses: superclass) first equals: subclass.
	self assert: (self getSubClasses: subclass) isEmpty
]

{ #category : #initialization }
FM3RelationSlotTestCase >> testTestSetClassToMethod [

	| class method |
	method := self newTestingMethod.

	class := self newTestingClass.

	self assert: (self getMethods: class) isEmpty.
	self assert: (self getClass: method) isNil.

	self addMethod: method to: class.

	self deny: (self getMethods: class) isEmpty.
	self deny: (self getClass: method) isNil.
	self assert: (self getMethods: class) first equals: method
]

{ #category : #initialization }
FM3RelationSlotTestCase >> testTestSetOneToOne [

	| class method |
	method := self newTestingMethod.

	class := self newConvenientThatThing.

	self assert: (self getMethodFromThatThing: class) isNil.
	self assert: (self getThatThing: method) isNil.

	self setThatThing: class to: method.

	self assert: (self getMethodFromThatThing: class) equals: method.
	self assert: (self getThatThing: method) equals: class
]

{ #category : #initialization }
FM3RelationSlotTestCase >> testTestSetOneToOneToAnObjectGetsMessageNotUnderstood [

	| class method |
	method := self newTestingMethod.

	class := Object new.

	self
		should: [ self setThatThing: class to: method ]
		raise: MessageNotUnderstood
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> thatThingSlot [

	^ testingMethod allSlots detect: [ :s | s name = #thatThing ]
]

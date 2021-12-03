Class {
	#name : #FM3RelationSlotTestCase,
	#superclass : #TestCase,
	#instVars : [
		'testingClass',
		'testingMethod'
	],
	#category : #'Fame-Tests-Slots'
}

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getSubClasses: aGeneratedTestCaseMyClass [

	^ self subclassesSlot read: aGeneratedTestCaseMyClass
]

{ #category : #'as yet unclassified' }
FM3RelationSlotTestCase >> getSuperClass: aGeneratedTestCaseMyClass [

	^ self superClassSlot read: aGeneratedTestCaseMyClass
]

{ #category : #'instance creation' }
FM3RelationSlotTestCase >> newTestingClass [

	| entry |
	entry := testingClass new.
	testingClass initializeSlots: entry.
	^ entry
]

{ #category : #initialization }
FM3RelationSlotTestCase >> setSuperClass: aGeneratedTestCaseMyClass to: aGeneratedTestCaseMyClass2 [ 
	self superClassSlot write: aGeneratedTestCaseMyClass2 to: aGeneratedTestCaseMyClass
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
					                  opposite: #definingType) };
		                 tag: 'Slots';
		                 package: 'Fame-Tests-Generated') install.
	testingMethod := ((Object << #GeneratedTestCaseMyMethod)
		                  slots:
			                  { (#sclass => FMOne
				                   type: #GeneratedTestCaseMyClass
				                   opposite: #methods) };
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

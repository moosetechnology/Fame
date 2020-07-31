Class {
	#name : #FM3Trait,
	#superclass : #FM3Type,
	#instVars : [
		'implementingClass'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #meta }
FM3Trait class >> annotation [
	<FMClass: #Trait super: #FM3Type>
	<package: #FM3>

]

{ #category : #visiting }
FM3Trait >> accept: aVisitor [
	aVisitor visitTrait: self
]

{ #category : #'accessing-query' }
FM3Trait >> allComplexProperties [
	^ self allProperties reject: [ :attr | attr type isNotNil and: [ attr type isPrimitive ] ]
]

{ #category : #'accessing-query' }
FM3Trait >> allContainerProperties [
	^ self allProperties select: #isContainer
]

{ #category : #'accessing-query' }
FM3Trait >> allPrimitiveProperties [
	^ self allProperties select: [ :attr | attr type isNotNil and: [ attr type isPrimitive ] ]
]

{ #category : #accessing }
FM3Trait >> allSuperclasses [
	| mmclass superclasses |
	superclasses := OrderedCollection new.
	mmclass := self.

	[ mmclass hasSuperclass ]
		whileTrue: [ mmclass := mmclass superclass.
			superclasses add: mmclass ].
	^ superclasses
]

{ #category : #accessing }
FM3Trait >> allSuperclassesDo: aBlock [
	self allSuperclasses do: [ :each | aBlock value: each ]
]

{ #category : #'accessing-query' }
FM3Trait >> complexProperties [
	^ self properties reject: [ :attr | attr type isPrimitive ]
]

{ #category : #'instance creation' }
FM3Trait >> createInstance [
	^ implementingClass
		ifNil: [ FMRuntimeElement new description: self ]
		ifNotNil: [ implementingClass new ]
]

{ #category : #testing }
FM3Trait >> hasPackage [
	^ package isNotNil
]

{ #category : #accessing }
FM3Trait >> implementingClass [
	^ implementingClass
]

{ #category : #accessing }
FM3Trait >> implementingClass: smalltalkClass [
	implementingClass := smalltalkClass
]

{ #category : #accessing }
FM3Trait >> inheritsFrom: aClass [
	self allSuperclassesDo: [ :each | each = aClass ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
FM3Trait >> isAbstract [
	self flag: 'This is for compatibility purpose'.
	^ true
]

{ #category : #testing }
FM3Trait >> isBuiltIn [
	^ self isPrimitive or: [ self isRoot ]
]

{ #category : #testing }
FM3Trait >> isConstant [
	^ false
]

{ #category : #testing }
FM3Trait >> isFM3Trait [
	^ true
]

{ #category : #testing }
FM3Trait >> isPrimitive [
	<FMProperty: #primitive type: #Boolean>
	<derived>
	^ false
]

{ #category : #testing }
FM3Trait >> isRoot [
	<FMProperty: #root type: #Boolean>
	<derived>
	^ false
]

{ #category : #accessing }
FM3Trait >> owner [
	^ self package
]

{ #category : #'accessing-query' }
FM3Trait >> ownerProperties [
	^ self allProperties select: #isContainer
]

{ #category : #'accessing-query' }
FM3Trait >> primitiveProperties [
	^ self properties select: [ :attr | attr type isPrimitive ]
]

{ #category : #accessing }
FM3Trait >> withAllSuperclasses [
	^ self allSuperclasses
		add: self;
		yourself
]

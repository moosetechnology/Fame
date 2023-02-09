Class {
	#name : #FM3Trait,
	#superclass : #FM3Type,
	#instVars : [
		'implementingClass',
		'users'
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

	^ aVisitor visitTrait: self
]

{ #category : #adding }
FM3Trait >> addUser: aFM3Type [

	self users add: aFM3Type
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

{ #category : #initialization }
FM3Trait >> initialize [

	super initialize.
	users := Set new
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

	<FMProperty: #primitive type: #Boolean defaultValue: false>
	<derived>
	^ false
]

{ #category : #testing }
FM3Trait >> isRoot [

	<FMProperty: #root type: #Boolean defaultValue: false>
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
FM3Trait >> users [

	<FMProperty: #users type: #FM3Type>
	<multivalued>
	^ users
]

{ #category : #accessing }
FM3Trait >> users: aCollection [

	users := aCollection
]

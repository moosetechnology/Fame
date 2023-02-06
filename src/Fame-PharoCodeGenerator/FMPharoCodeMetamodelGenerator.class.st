Class {
	#name : #FMPharoCodeMetamodelGenerator,
	#superclass : #Object,
	#instVars : [
		'metamodel',
		'changesToApply',
		'prefix'
	],
	#category : #'Fame-PharoCodeGenerator'
}

{ #category : #generation }
FMPharoCodeMetamodelGenerator class >> generateFor: aMetamodel prefix: aString [

	self new
		prefix: aString;
		generateFor: aMetamodel
]

{ #category : #generation }
FMPharoCodeMetamodelGenerator >> collectChangesToApply [

	self
		recordPackagesChanges;
		recordClassesChanges
]

{ #category : #generation }
FMPharoCodeMetamodelGenerator >> generateFor: aMetamodel [

	metamodel := aMetamodel.

	EpMonitor disableDuring: [ 
		self collectChangesToApply.
		changesToApply do: #apply ]
]

{ #category : #initialization }
FMPharoCodeMetamodelGenerator >> initialize [

	super initialize.
	changesToApply := OrderedCollection new
]

{ #category : #accessing }
FMPharoCodeMetamodelGenerator >> prefix [
	^ prefix
]

{ #category : #accessing }
FMPharoCodeMetamodelGenerator >> prefix: anObject [
	prefix := anObject
]

{ #category : #generation }
FMPharoCodeMetamodelGenerator >> recordClassChangesFor: aFMType [

	| realClass name |
	name := self prefix , aFMType name.
	realClass := self class environment classNamed: name.
	self flag: #todo.
	realClass
		ifNil: [ changesToApply add: (FmxClassAddition definition: (aFMType definitionWithPrefix: self prefix)) ]
		ifNotNil: [ "self recordAdoptionOfClassDefinitionFrom: realClass to: aFMType" ].
	"self recordClassCommentChangeOf: realClass to: aFMType.
	self recordMethodsAdoptionsOf: realClass to: aFMType realClassName: aFMType name.
	self recordMethodsAdoptionsOf: (realClass ifNotNil: #class) to: aFMType classSide realClassName: aFMType name"
]

{ #category : #generation }
FMPharoCodeMetamodelGenerator >> recordClassesChanges [

	| notSorted sorted toMove |
	metamodel classes ifEmpty: [ ^ self ].

	notSorted := metamodel classes asOrderedCollection.

	sorted := OrderedCollection new.
	[ 
	toMove := notSorted select: [ :each | notSorted noneSatisfy: [ :toCompare | each dependsOn: toCompare ] ].
	toMove ifEmpty: [ self error: 'Classes cycling dependency' ].
	sorted addAll: toMove.
	notSorted removeAll: toMove.
	notSorted isEmpty ] whileFalse.

	sorted do: [ :each | self recordClassChangesFor: each ]
]

{ #category : #generation }
FMPharoCodeMetamodelGenerator >> recordPackagesChanges [

	metamodel packages
		reject: [ :package | RPackageOrganizer default includesPackageNamed: package name ]
		thenDo: [ :package | changesToApply add: (FmxPackageAddition named: package name) ]
]

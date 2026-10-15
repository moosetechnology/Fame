"
I build a metamodel that can be used to be materialized and clean what could have been created by tests
"
Class {
	#name : 'FMMaterializerTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'metamodel',
		'trait',
		'class',
		'superclass',
		'propertyA',
		'anotherClass',
		'relationClassToAnotherClass',
		'relationAnotherClassToClass',
		'package',
		'propertyWithoutOpposite',
		'superclassProperty',
		'remotePackage',
		'remoteClass',
		'relationRemoteClassToClass',
		'relationClassToRemoteClass',
		'classRemoteProperty'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'accessing' }
FMMaterializerTestResource >> anotherClass [

	^ anotherClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> clazz [

	^ class
]

{ #category : 'running' }
FMMaterializerTestResource >> defineRemoteClass [

	remotePackage := FM3Package named:
		                 'Fame-Materialize-TestResource-Remote'.
	metamodel add: remotePackage.
	remoteClass := FM3Class named: 'RemoteClass'.

	relationRemoteClassToClass := (FM3Property named:
		                               'remoteClassToClass') type: class.
	relationClassToRemoteClass := (FM3Property named:
		                               'classToRemoteClass') type:
		                              remoteClass.
	relationClassToRemoteClass package: remotePackage.
	relationRemoteClassToClass opposite: relationClassToRemoteClass.
	relationClassToRemoteClass opposite: relationRemoteClassToClass.

	classRemoteProperty := (FM3Property named: self remoteNumberPropertyName)
		                       type: FM3Number instance.
	classRemoteProperty package: remotePackage.
	class properties addAll: {
			relationClassToRemoteClass.
			classRemoteProperty }.
	remoteClass properties: { relationRemoteClassToClass }.
	metamodel add: remoteClass.
	remoteClass package: remotePackage
]

{ #category : 'running' }
FMMaterializerTestResource >> metamodel [

	^ metamodel
]

{ #category : 'running' }
FMMaterializerTestResource >> propertyA [

	^ propertyA
]

{ #category : 'as yet unclassified' }
FMMaterializerTestResource >> propertyAComment [

	^ 'This is a super property description'
]

{ #category : 'accessing' }
FMMaterializerTestResource >> propertyWithoutOpposite [

	^ propertyWithoutOpposite
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationAnotherClassToClass [

	^ relationAnotherClassToClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationAnotherClassToClass: anObject [

	relationAnotherClassToClass := anObject
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationClassToAnotherClass [

	^ relationClassToAnotherClass
]

{ #category : 'accessing' }
FMMaterializerTestResource >> relationClassToAnotherClass: anObject [

	relationClassToAnotherClass := anObject
]

{ #category : 'as yet unclassified' }
FMMaterializerTestResource >> relationClassToAnotherClassComment [

	^ 'A relation comment'
]

{ #category : 'as yet unclassified' }
FMMaterializerTestResource >> relationClassToRemoteClass [

	^ relationClassToRemoteClass
]

{ #category : 'as yet unclassified' }
FMMaterializerTestResource >> remoteNumberPropertyName [

	^ #'remoteNumberProperty' 
]

{ #category : 'running' }
FMMaterializerTestResource >> remotePackage [

	^ remotePackage
]

{ #category : 'as yet unclassified' }
FMMaterializerTestResource >> remotePackageName [

	^ #'Fame-Materialize-TestResource-Remote'
]

{ #category : 'running' }
FMMaterializerTestResource >> setUp [

	super setUp.
	metamodel := FMMetaModel new.
	package := FM3Package named: 'Fame-Materialize-TestResource'.
	metamodel add: package.
	trait := FM3Trait named: 'TATrait'.
	metamodel add: trait.
	class := FM3Class named: 'AClass'.
	class package: package.
	metamodel add: class.
	anotherClass := FM3Class named: 'AnotherClass'.
	metamodel add: anotherClass.
	anotherClass package: package.
	superclass := FM3Class named: 'ASuperClass'.
	superclassProperty := (FM3Property named: 'superclassProperty')
		                      type: FM3Number instance.
	superclass properties: {
			superclassProperty.
			"duplicatedProperty are properties with the same name on two different FM3Type in the same type hierarchy"
			((FM3Property named: 'duplicatedProperty') type: FM3Number instance) }.
	metamodel add: superclass.
	trait users: {
			class.
			anotherClass }.
	class traits: { trait }.
	anotherClass traits: { trait }.
	propertyA := (FM3Property named: 'aProperty') type:
		             FM3String instance.
	propertyA comment: self propertyAComment.
	relationClassToAnotherClass := (FM3Property named:
		                                'relationClassToAnotherClass')
		                               type: anotherClass.
	relationClassToAnotherClass isMultivalued: true.
	relationAnotherClassToClass := (FM3Property named:
		                                'relationAnotherClassToClass')
		                               type: class.
	relationClassToAnotherClass opposite: relationAnotherClassToClass.
	relationAnotherClassToClass opposite: relationClassToAnotherClass.
	relationClassToAnotherClass comment: self relationClassToAnotherClassComment.
	anotherClass properties: { relationAnotherClassToClass }.
	trait package: package.
	propertyWithoutOpposite := (FM3Property named:
		                            'propertyWithoutOpposite') type: class.
	propertyWithoutOpposite isMultivalued: true.
	class properties: {
			propertyA.
			relationClassToAnotherClass.
			propertyWithoutOpposite.
			((FM3Property named: 'objectProperty') type: FM3Object instance).

			"duplicatedProperty are properties with the same name on two different FM3Type in the same type hierarchy"
			((FM3Property named: 'duplicatedProperty') type: FM3Number instance) }.
	class superclass: superclass.
	superclass package: package.
	
	self defineRemoteClass.
]

{ #category : 'accessing' }
FMMaterializerTestResource >> superclass [

	^ superclass
]

{ #category : 'running' }
FMMaterializerTestResource >> tearDown [

	[ 'Fame-Materialize-TestResource' asPackage removeFromSystem ]
		on: Error
		do: [ ].
	[ self remotePackageName asPackage removeFromSystem ]
		on: Error
		do: [ ].
	super tearDown
]

{ #category : 'accessing' }
FMMaterializerTestResource >> trait [

	^ trait
]

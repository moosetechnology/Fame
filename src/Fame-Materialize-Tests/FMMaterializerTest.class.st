"
A FMMaterializerTest is a test class for testing the behavior of FMMaterializer
"
Class {
	#name : 'FMMaterializerTest',
	#superclass : 'TestCase',
	#instVars : [
		'materializer'
	],
	#category : 'Fame-Materialize-Tests',
	#package : 'Fame-Materialize-Tests'
}

{ #category : 'accessing' }
FMMaterializerTest class >> resources [
	^ { FMMaterializerTestResource }
]

{ #category : 'running' }
FMMaterializerTest >> setUp [

	super setUp.
	materializer := FMMaterializer new
]

{ #category : 'tests' }
FMMaterializerTest >> testMaterialize [

	materializer materializePackage:
		FMMaterializerTestResource current metamodel packages anyOne.
	self packageOrganizer hasPackage:
		FMMaterializerTestResource current metamodel packages anyOne name
]

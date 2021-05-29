"
Description
--------------------

I am a simple slot unique to Fame.

For now, I do nothing specific except annotationg the variable with the fact that the variable is a Fame property.

Examples
--------------------

	Trait named: #FamixTMethod
	 	slots: { #isAbstract => FMProperty. #isClassSide => FMProperty. #kind => FMProperty }
		package: 'Famix-Traits-Method'
"
Class {
	#name : #FMProperty,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'defaultValue'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #testing }
FMProperty >> defaultValue [
	^ defaultValue 
]

{ #category : #testing }
FMProperty >> defaultValue: aValue [
	defaultValue := aValue
]

{ #category : #testing }
FMProperty >> isFameSlot [
	^ true
]

{ #category : #testing }
FMProperty >> printOn: aStream [

	aStream
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name.
	self defaultValue ifNotNil: [ 
		aStream
			nextPutAll: ' defaultValue: ';
			store: self defaultValue ]
]

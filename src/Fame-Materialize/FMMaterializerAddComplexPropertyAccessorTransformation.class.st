Class {
	#name : 'FMMaterializerAddComplexPropertyAccessorTransformation',
	#superclass : 'RBAddVariableAccessorTransformation',
	#instVars : [
		'fm3Property'
	],
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'as yet unclassified' }
FMMaterializerAddComplexPropertyAccessorTransformation class >> fm3Property: aFM3Property class: aClassName [

	^ self new
		  variable: aFM3Property name
		  class: aClassName
		  classVariable: false;
		  fm3Property: aFM3Property;
		  yourself
]

{ #category : 'private' }
FMMaterializerAddComplexPropertyAccessorTransformation >> defineGetterMethod [

	getterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode:
				 ('<1s><r><r><t>%<generated><r><t>%<FMComment: <4p>><r><t>^ <2s>'
					  expandMacrosWith: getterMethod
					  with: variableName
					  with: fm3Property type name
					  with: (fm3Property comment ifNil: [ '' ]))
			 in: self definingClass
			 withProtocol: 'accessing').

	^ getterMethod
]

{ #category : 'private' }
FMMaterializerAddComplexPropertyAccessorTransformation >> defineSetterMethod [

	| sourceCode |
	sourceCode := fm3Property isMultivalued
		              ifTrue: [
		              '<1s> anObject<r><r><t><2s> value: anObject' ]
		              ifFalse: [ '<1s> anObject<r><r><t><2s> := anObject' ].
	setterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString , ':'.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode: (sourceCode
					  expandMacrosWith: setterMethod
					  with: variableName
					  with: fm3Property isMultivalued)
			 in: self definingClass
			 withProtocol: 'accessing').
	^ setterMethod
]

{ #category : 'accessing' }
FMMaterializerAddComplexPropertyAccessorTransformation >> fm3Property [

	^ fm3Property
]

{ #category : 'accessing' }
FMMaterializerAddComplexPropertyAccessorTransformation >> fm3Property: anObject [

	fm3Property := anObject
]

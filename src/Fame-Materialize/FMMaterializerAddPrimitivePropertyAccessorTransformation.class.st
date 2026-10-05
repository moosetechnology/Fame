Class {
	#name : 'FMMaterializerAddPrimitivePropertyAccessorTransformation',
	#superclass : 'RBAddVariableAccessorTransformation',
	#instVars : [
		'fm3Property'
	],
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'as yet unclassified' }
FMMaterializerAddPrimitivePropertyAccessorTransformation class >> fm3Property: aFM3Property class: aClassName [

	^ self new
		  variable: aFM3Property name
		  class: aClassName
		  classVariable: false;
		  fm3Property: aFM3Property;
		  yourself
]

{ #category : 'private' }
FMMaterializerAddPrimitivePropertyAccessorTransformation >> defineGetterMethod [

	getterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode:
				 ('<1s><r><r><t>%<FMProperty: #<1s> type: #<3s>><r><t>%<generated><r><t>%<FMComment: <4p>><r><t>^ <2s>'
					  expandMacrosWith: getterMethod
					  with: variableName
					  with: fm3Property type name
					  with: (fm3Property comment ifNil: [ '' ]))
			 in: self definingClass
			 withProtocol: 'accessing').

	^ getterMethod
]

{ #category : 'accessing' }
FMMaterializerAddPrimitivePropertyAccessorTransformation >> fm3Property [

	^ fm3Property
]

{ #category : 'accessing' }
FMMaterializerAddPrimitivePropertyAccessorTransformation >> fm3Property: anObject [

	fm3Property := anObject
]

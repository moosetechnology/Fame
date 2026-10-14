Class {
	#name : 'FMMaterializerAddRemotePrimitivePropertyAccessorTransformation',
	#superclass : 'RBAddVariableAccessorTransformation',
	#instVars : [
		'fm3Property'
	],
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'as yet unclassified' }
FMMaterializerAddRemotePrimitivePropertyAccessorTransformation class >> fm3Property: aFM3Property class: aClassName [

	^ self new
		  variable: aFM3Property name
		  class: aClassName
		  classVariable: false;
		  fm3Property: aFM3Property;
		  yourself
]

{ #category : 'private' }
FMMaterializerAddRemotePrimitivePropertyAccessorTransformation >> defineGetterMethod [

	| packageName |
	getterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString.
	packageName := ('*' , fm3Property package name) asSymbol.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode:
				 ('<1s><r><r><t>%<FMProperty: #<1s> type: #<3s>><r><t>%<generated><r><t>%<FMComment: <4p>><r><t>^ self attributeAt: #<1s>'
					  expandMacrosWith: getterMethod
					  with: variableName
					  with: fm3Property type name
					  with: (fm3Property comment ifNil: [ '' ]))
			 in: self definingClass
			 withProtocol: packageName).

	^ getterMethod
]

{ #category : 'private' }
FMMaterializerAddRemotePrimitivePropertyAccessorTransformation >> defineSetterMethod [

	| sourceCode packageName |
	sourceCode := '<1s> anObject<r><r><t>%<generated><r><t>self attributeAt: #<2s> put: anObject'.
	setterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString , ':'.
	packageName := ('*' , fm3Property package name) asSymbol.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode: (sourceCode
					  expandMacrosWith: setterMethod
					  with: variableName
					  with: fm3Property isMultivalued)
			 in: self definingClass
			 withProtocol: packageName).
	^ setterMethod
]

{ #category : 'accessing' }
FMMaterializerAddRemotePrimitivePropertyAccessorTransformation >> fm3Property [

	^ fm3Property
]

{ #category : 'accessing' }
FMMaterializerAddRemotePrimitivePropertyAccessorTransformation >> fm3Property: anObject [

	fm3Property := anObject
]

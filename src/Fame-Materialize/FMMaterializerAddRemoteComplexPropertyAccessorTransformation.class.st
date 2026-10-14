Class {
	#name : 'FMMaterializerAddRemoteComplexPropertyAccessorTransformation',
	#superclass : 'RBAddVariableAccessorTransformation',
	#instVars : [
		'fm3Property'
	],
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'as yet unclassified' }
FMMaterializerAddRemoteComplexPropertyAccessorTransformation class >> fm3Property: aFM3Property class: aClassName [

	^ self new
		  variable: aFM3Property name
		  class: aClassName
		  classVariable: false;
		  fm3Property: aFM3Property;
		  yourself
]

{ #category : 'private' }
FMMaterializerAddRemoteComplexPropertyAccessorTransformation >> defineGetterMethod [

	| packageName sourceCode |
	sourceCode := fm3Property isMultivalued
		              ifTrue: [
				              fm3Property opposite isMultivalued
					              ifTrue: [
						              '<1s><r><r><t>%<generated><r><t>%<FMProperty: #<1s> type: #<3s>><r><t>%<FMComment: <4p>><r><t>%<multivalued><r><t>^ self attributeAt: #<2s> ifAbsent: [ FMMultiMultivalueLink on: self opposite: #<5s> ]' ]
					              ifFalse: [
						              '<1s><r><r><t>%<generated><r><t>%<FMProperty: #<1s> type: #<3s>><r><t>%<FMComment: <4p>><r><t>%<multivalued><r><t>^ self attributeAt: #<2s> ifAbsent: [ FMMultivalueLink on: self opposite: #<5s> ]' ] ]
		              ifFalse: [
			              '<1s><r><r><t>%<generated><r><t>%<FMProperty: #<1s> type: #<3s>><r><t>%<FMComment: <4p>><r><t>^ self attributeAt: #<2s> ifAbsent: [ nil ]' ].

	getterMethod := self
		                safeMethodNameFor: self definingClass
		                basedOn: variableName asString.
	packageName := ('*' , fm3Property package name) asSymbol.
	self generateChangesFor: (RBAddMethodTransformation
			 model: self model
			 sourceCode: (sourceCode expandMacrosWithArguments: {
						  getterMethod.
						  variableName.
						  fm3Property type name.
						  (fm3Property comment ifNil: [ '' ]).
						  fm3Property opposite name })
			 in: self definingClass
			 withProtocol: packageName).

	^ getterMethod
]

{ #category : 'private' }
FMMaterializerAddRemoteComplexPropertyAccessorTransformation >> defineSetterMethod [

	| sourceCode packageName |
	sourceCode := fm3Property isMultivalued
		              ifTrue: [
		              '<1s> anObject<r><r><t>%<generated><r><t>self <2s> value: anObject' ]
		              ifFalse: [ '<1s> anObject<r><r><t>%<generated><r><t><2s> := anObject' ].
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
FMMaterializerAddRemoteComplexPropertyAccessorTransformation >> fm3Property [

	^ fm3Property
]

{ #category : 'accessing' }
FMMaterializerAddRemoteComplexPropertyAccessorTransformation >> fm3Property: anObject [

	fm3Property := anObject
]

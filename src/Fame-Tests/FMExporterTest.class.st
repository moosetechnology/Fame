Class {
	#name : #FMExporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMExporterTest >> testExportAsJSon [
	| printer metamodel lines |
	printer := FMJSONPrinter onString.
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.
	metamodel exportWithPrinter: printer.
	lines := printer stream contents lines.
	self assert: (lines first beginsWith: '[') .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Package'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Class'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Property'] ) .
	self assert: (lines last endsWith: ']' )
]

{ #category : #tests }
FMExporterTest >> testExportAsMSE [
	| printer metamodel lines |
	printer := FMMSEPrinter onString.
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.
	metamodel exportWithPrinter: printer.
	self assert: printer stream contents isString.
	lines := printer stream contents lines.
	self assert: lines first equals: '(' .
	self assert: printer stream contents lines size equals: 66.
	self assert: (lines allButFirst allSatisfy: [ :l | l beginsWith: '	'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Package'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Class'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Property'] ) .
	self assert: (lines last endsWith: ')' )
]

{ #category : #tests }
FMExporterTest >> testExportAsXML [
	| printer metamodel lines |
	printer := FMXMLPrinter onString.
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.
	metamodel exportWithPrinter: printer.
	lines := printer stream contents lines.
	self assert: (lines first beginsWith: '<') .
	self assert: (lines allButFirst allSatisfy: [ :l | (l beginsWith: '<') or: [l beginsWith: '	']] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Package'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Class'] ) .
	self assert: (lines anySatisfy: [ :l | l includesSubstring: 'FM3.Property'] ) .
	self assert: (lines allSatisfy: [ :l | l endsWith: '>'] )
]

{ #category : #tests }
FMExporterTest >> testExportedModelIsTheSameAsBeforeExport [
	| metamodel printer |
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.

	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 3.
	self assert: metamodel properties size equals: 6.

	printer := FMMSEPrinter onString.
	metamodel exportWithPrinter: printer.
	metamodel := FMMetaModel fromString: printer stream contents.

	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 3.
	self assert: metamodel properties size equals: 6
]

{ #category : #tests }
FMExporterTest >> testMSEExportWithWrongTypeRaiseError [
	| printer model |
	model := FMModel withMetamodel: FMEquationSystemExample createMetamodel.

	model
		add:
			(EQNumerical new
				number: DateAndTime now; "Here a number primitive is expected but a date and time is passed."
				yourself).

	printer := FMMSEPrinter onString.
	self should: [ model exportWithPrinter: printer ] raise: Error
]

"
Description
--------------------

I am an error raised when a model been imported contains a syntax error.
"
Class {
	#name : 'FMSyntaxError',
	#superclass : 'Error',
	#instVars : [
		'parser'
	],
	#category : 'Fame-ImportExport-Importers',
	#package : 'Fame-ImportExport',
	#tag : 'Importers'
}

{ #category : 'accessing' }
FMSyntaxError >> parser [
	^ parser
]

{ #category : 'accessing' }
FMSyntaxError >> parser: anObject [
	parser := anObject
]

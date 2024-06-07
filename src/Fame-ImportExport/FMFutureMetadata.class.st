Class {
	#name : #FMFutureMetadata,
	#superclass : #FMFuture,
	#instVars : [
		'instance',
		'currentProperty',
		'importer'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #accessing }
FMFutureMetadata >> addToPropertyValues: aValue [

	instance setProperty: self currentProperty value: aValue
]

{ #category : #accessing }
FMFutureMetadata >> beginProperty: aString [

	self assert: currentProperty isNil.
	currentProperty := aString
]

{ #category : #accessing }
FMFutureMetadata >> currentProperty [

	^ currentProperty
]

{ #category : #accessing }
FMFutureMetadata >> endProperty [

	currentProperty := nil
]

{ #category : #accessing }
FMFutureMetadata >> in: anImporter named: aString [

	importer := anImporter.
	instance := MooseModelMetadataHolder new "createInstance"
]

{ #category : #accessing }
FMFutureMetadata >> initialize [

	super initialize.
	instance := MooseModelMetadataHolder new
]

{ #category : #accessing }
FMFutureMetadata >> instance [

	^ instance
]

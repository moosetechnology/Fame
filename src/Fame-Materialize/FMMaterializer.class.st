Class {
	#name : 'FMMaterializer',
	#superclass : 'Object',
	#category : 'Fame-Materialize',
	#package : 'Fame-Materialize'
}

{ #category : 'private' }
FMMaterializer >> materialize: aFMMetaModel [

	aFMMetaModel packages do: [ :package |
		self materializePackage: package ]
]

{ #category : 'as yet unclassified' }
FMMaterializer >> materializePackage: aFM3Package [

	self packageOrganizer ensurePackage: aFM3Package name
]

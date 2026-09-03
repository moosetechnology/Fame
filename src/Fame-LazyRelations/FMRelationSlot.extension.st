Extension { #name : 'FMRelationSlot' }

{ #category : '*Fame-LazyRelations' }
FMRelationSlot >> read: anObject [

	^ (super read: anObject) fmValueReadFrom: self owner: anObject
]

{ #category : '*Fame-LazyRelations' }
FMRelationSlot >> writeMaterialized: aValue to: anObject [

	^ super write: aValue to: anObject
]

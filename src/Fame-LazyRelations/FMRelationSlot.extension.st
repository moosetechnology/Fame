Extension { #name : 'FMRelationSlot' }

{ #category : '*Fame-LazyRelations' }
FMRelationSlot >> read: anObject [

	^ (super read: anObject) fmValueReadFrom: self owner: anObject
]

Extension { #name : #Behavior }

{ #category : #'*Fame-Core' }
Behavior >> allGeneratedTraits [

	^ self allTraits select: #isMetamodelEntity
]

{ #category : #'*Fame-Core' }
Behavior >> localGeneratedTraits [

	^ self traits select: #isMetamodelEntity
]

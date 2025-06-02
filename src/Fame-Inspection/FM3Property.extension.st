Extension { #name : #FM3Property }

{ #category : #'*Fame-Inspection' }
FM3Property >> inspectionTypeString [

	^ String streamContents: [ :s |
			  self type ifNotNil: [ :t | s nextPutAll: t name ].
			  self isMultivalued ifTrue: [ s nextPutAll: ' *' ].
			  self isDerived ifTrue: [ s nextPutAll: ' /' ] ]
]

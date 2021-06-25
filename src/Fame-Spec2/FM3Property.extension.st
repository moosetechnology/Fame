Extension { #name : #FM3Property }

{ #category : #'*Fame-Spec2' }
FM3Property >> stFmTypeString [
	^ String
		streamContents: [ :s | 
			self type ifNotNil: [ :t | s nextPutAll: t name ].
			self isMultivalued ifTrue: [ s nextPutAll: ' *' ].
			self isDerived ifTrue: [ s nextPutAll: ' /' ] ]
]

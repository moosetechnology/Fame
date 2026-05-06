Extension { #name : 'FM3Property' }

{ #category : '*Fame-Inspection' }
FM3Property >> inspectionRelationTypeString [
	"We assume the above specificities are mutually exclusive. They are conceptually, if not programmatically"

	| specificity |
	specificity := String streamContents: [ :s |
			               self isContainer ifTrue: [ s << 'container' ].
			               self isChildrenProperty ifTrue: [ s << 'children' ].
			               self isTarget ifTrue: [ s << 'target' ].
			               self isSource ifTrue: [ s << 'source' ] ].

	^ specificity ifNotEmpty: [ specificity ] ifEmpty: [ '-' ]
]

{ #category : '*Fame-Inspection' }
FM3Property >> inspectionTypeString [

	^ String streamContents: [ :s |
			  self type ifNotNil: [ :t | s nextPutAll: t name ].
			  self isMultivalued ifTrue: [ s nextPutAll: ' *' ].
			  self isDerived ifTrue: [ s nextPutAll: ' /' ] ]
]

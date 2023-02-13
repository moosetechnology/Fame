Extension { #name : #FM3Class }

{ #category : #'*Fame-PharoCodeGenerator' }
FM3Class >> dependsOn: anotherType [

	self == anotherType ifTrue: [ ^ false ].

	(self allSuperclasses includes: anotherType) ifTrue: [ ^ true ].

	self flag: #todo. "Check if still needed when based on fame and not ring"
	((self withAllSuperclasses flatCollect: [ :each | each traits ]) includes: anotherType) ifTrue: [ ^ true ].

	^ false
]

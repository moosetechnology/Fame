Extension { #name : #FameNameConventionBetweenFM3AndSmalltalkRule }

{ #category : #'*Fame-Deprecated' }
FameNameConventionBetweenFM3AndSmalltalkRule >> group [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class group
]

{ #category : #'*Fame-Deprecated' }
FameNameConventionBetweenFM3AndSmalltalkRule >> name [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class ruleName
]

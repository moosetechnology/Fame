Extension { #name : #Dictionary }

{ #category : #'*Fame-Core' }
Dictionary >> fmModelAt: key [
	"I exist only for performance reasons. I avoid to create a #ifAbsent: block. In moose query we call this so much that the creation cost of the block and its garbage collection is too high :("

	^ (array at: (self findElementOrNil: key))
		ifNil: [ self at: key put: IdentityDictionary new ]
		ifNotNil: [ :assoc | assoc value ]
]

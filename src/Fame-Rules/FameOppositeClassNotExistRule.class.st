"
Check if the opposite class declared in a pragma #MSEProperty:type:opposite: is defined.
"
Class {
	#name : #FameOppositeClassNotExistRule,
	#superclass : #ReAbstractRule,
	#category : #'Fame-Rules'
}

{ #category : #testing }
FameOppositeClassNotExistRule class >> checksMethod [

	^ true
]

{ #category : #accessing }
FameOppositeClassNotExistRule class >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameOppositeClassNotExistRule class >> ruleName [

	^ 'An opposite class declared in pragma #FMProperty:type:opposite: does not exist'
]

{ #category : #accessing }
FameOppositeClassNotExistRule class >> uniqueIdentifierName [
	^ 'OppositeClassNotExist'
]

{ #category : #running }
FameOppositeClassNotExistRule >> basicCheck: aMethod [

	((aMethod methodClass methodNamed: aMethod selector) pragmaAt: #FMProperty:type:opposite:) ifNotNil: [ :pragma |
		self class environment at: (pragma argumentAt: 2) ifPresent: [ :oppositeClass | ^ true ] ].
	^ false
]

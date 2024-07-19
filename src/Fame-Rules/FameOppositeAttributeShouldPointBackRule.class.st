"
Check if an opposite attribute declared in a pragma #MSEProperty:type:opposite: also define a pragma pointing back to the initial class and the initial attribute.
"
Class {
	#name : #FameOppositeAttributeShouldPointBackRule,
	#superclass : #ReAbstractRule,
	#category : #'Fame-Rules'
}

{ #category : #testing }
FameOppositeAttributeShouldPointBackRule class >> checksMethod [

	^ true
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule class >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule class >> ruleName [

	^ 'An opposite attribute declared in pragma does not point back to the initial attribute'
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule class >> uniqueIdentifierName [
	^ 'OppositeAttributeShouldPointBack'
]

{ #category : #running }
FameOppositeAttributeShouldPointBackRule >> basicCheck: aMethod [

	| class |
	class := aMethod methodClass.
	((class methodNamed: aMethod selector) pragmaAt: #FMProperty:type:opposite:) ifNotNil: [ :pragma |
		self class environment at: (pragma argumentAt: 2) ifPresent: [ :oppositeClass |
			oppositeClass
				compiledMethodAt: (pragma argumentAt: 3)
				ifPresent: [ :oppositeCompiledMethod |
					(oppositeCompiledMethod pragmaAt: #FMProperty:type:opposite:)
						ifNotNil: [ :oppositePragma |
							(oppositePragma argumentAt: 2) = class name asSymbol ifFalse: [ ^ true ].
							(oppositePragma argumentAt: 3) = aMethod selector ifFalse: [ ^ true ] ]
						ifNil: [ ^ true ] ]
				ifAbsent: [ ^ true ] ] ].

	^ false
]

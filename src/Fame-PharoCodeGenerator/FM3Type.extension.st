Extension { #name : #FM3Type }

{ #category : #'*Fame-PharoCodeGenerator' }
FM3Type >> definitionWithPrefix: aString [

	self flag: #todo.
	"self owner slotsNeedFullDefinition 
		ifTrue: [ ^ self definitionWithSlots ]."
	^ String streamContents: [ :aStream | 
			aStream nextPut: $(.
		  self superclass name = 'Object' ifFalse: [ aStream nextPutAll: aString ].
		  aStream nextPutAll: self superclass name.
		  aStream
			  nextPutAll: ' << #';
			  nextPutAll: aString;
			  nextPutAll: self name.
		  " self owner hasTraitComposition ifTrue: [ 
			  aStream
				  cr;
				  tab;
				  nextPutAll: 'uses: ';
				  nextPutAll: self owner traitCompositionString ].
		  aStream
			  cr;
			  tab;
			  nextPutAll: 'instanceVariableNames: ';
			  store: self owner instanceVariablesString.
		  aStream
			  cr;
			  tab;
			  nextPutAll: 'classVariableNames: ';
			  store: self owner classVariablesString.
		 "
		  aStream
			  cr;
			  tab;
			  nextPutAll: 'package: ''';
			  nextPutAll: self package name;
			  nextPutAll: ''') install' ]
]

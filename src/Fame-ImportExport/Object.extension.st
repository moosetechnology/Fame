Extension { #name : #Object }

{ #category : #'*Fame-ImportExport' }
Object >> handleFameProperty: aSymbol value: anObject [
	"Override me if you want your object to deal with undefined properties loaded from a JSON.
	
	By default I'm logging the error and checking if we have a setter not metadescribed with the name of the property to execute. I return true if this is the case."

	| setter |
	setter := aSymbol asSymbol asMutator.
	self traceCr: 'Unknown property ''' , aSymbol , ''' in ' , self class asString.

	^ (self respondsTo: setter)
		  ifTrue: [
				  | value |
				  value := (anObject isCollection and: [ anObject size = 1 ])
					           ifTrue: [ anObject anyOne ]
					           ifFalse: [ anObject ].
				  self traceCr: 'Setter of the same name than the property detected. Falling back to this method.'.
				  self perform: setter with: value.
				  true ]
		  ifFalse: [ false ]
]

{ #category : #'*Fame-ImportExport' }
Object >> isDanglingReference [
	^ false
]

{ #category : #'*Fame-ImportExport' }
Object >> msePrintOn: aStream [
	self error: 'This type of object cannot be exported in a mse: ' , self class printString
]

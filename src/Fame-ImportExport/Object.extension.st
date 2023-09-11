Extension { #name : #Object }

{ #category : #'*Fame-ImportExport' }
Object >> handleFameProperty: aSymbol value: anObject [
	"override me if you want your object to deal with undefined properties loaded from MSE"

	self traceCr:
		'Unknown property ''' , aSymbol , ''' in ' , self class asString
]

{ #category : #'*Fame-ImportExport' }
Object >> isDanglingReference [
	^ false
]

{ #category : #'*Fame-ImportExport' }
Object >> msePrintOn: aStream [
	self error: 'This type of object cannot be exported in a mse: ' , self class printString
]

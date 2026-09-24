Extension { #name : 'Fraction' }

{ #category : '*Fame-ImportExport' }
Fraction >> famePrintOn: stream [
	self asFloat famePrintOn: stream
]

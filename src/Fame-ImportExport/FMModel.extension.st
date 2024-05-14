Extension { #name : #FMModel }

{ #category : #'*Fame-ImportExport' }
FMModel >> exportJsonString [

	^ String streamContents: [ :stream |
		  self exportWithPrinter: (FMJSONPrinter on: stream) ]
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportMSEString [

	^ String streamContents: [ :stream | self exportToMSEStream: stream ]
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportOn: aStream [

	self
		deprecated:
		'Please specify the format you want to export to. Default is MSE. JSON is also available.'
		transformWith: '`@receiver exportOn: `@stream'
			-> '`@receiver exportToMSEStream: `@stream'.

	self exportToMSEStream: aStream
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportString [

	self
		deprecated:
		'Please specify the format you want to export to. Default is MSE. JSON is also available.'
		transformWith:
		'`@receiver exportString' -> '`@receiver exportMSEString'.

	^ self exportMSEString
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportToMSEStream: aStream [

	self exportWithPrinter: (FMMSEPrinter on: aStream)
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportWithPrinter: aParseClient [

	FMModelExporter new
		model: self;
		printer: aParseClient;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel class >> fromJSONString: aString [

	^ self new
		  importJSONString: aString;
		  yourself
]

{ #category : #'*Fame-ImportExport' }
FMModel class >> fromString: aString [

	^ self new
		  importString: aString;
		  yourself
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importJSONStream: aReadStream [

	(FMImporter model: self)
		stream: aReadStream;
		parser: FMJSONParser;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importJSONString: mseString [

	self importJSONStream: mseString readStream
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importStream: aReadStream [

	(FMImporter model: self)
		stream: aReadStream;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importString: mseString [

	self importStream: mseString readStream
]

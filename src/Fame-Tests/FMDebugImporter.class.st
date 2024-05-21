Class {
	#name : #FMDebugImporter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'tokens'
	],
	#category : #'Fame-Tests'
}

{ #category : #parsing }
FMDebugImporter >> beginDocument [

	tokens := tokens copyWith: (Array with: #beginDocument)
]

{ #category : #parsing }
FMDebugImporter >> beginEntity: name [

	tokens := tokens copyWith: (Array with: #beginEntity: with: name)
]

{ #category : #parsing }
FMDebugImporter >> beginProperty: name [

	tokens := tokens copyWith: (Array with: #beginProperty: with: name)
]

{ #category : #accessing }
FMDebugImporter >> contents [

	^ tokens
]

{ #category : #parsing }
FMDebugImporter >> endDocument [

	tokens := tokens copyWith: (Array with: #endDocument)
]

{ #category : #parsing }
FMDebugImporter >> endEntity: name [

	tokens := tokens copyWith: (Array with: #endEntity: with: name)
]

{ #category : #parsing }
FMDebugImporter >> endProperty: name [

	tokens := tokens copyWith: (Array with: #endProperty: with: name)
]

{ #category : #accessing }
FMDebugImporter >> exportJsonString [

	| printer |

	printer := FMJSONPrinter onString.
	self replayOn: printer.
	^ printer stream contents
]

{ #category : #accessing }
FMDebugImporter >> exportMSEString [

	| printer |

	printer := FMMSEPrinter onString.
	self replayOn: printer.
	^ printer stream contents
]

{ #category : #initialization }
FMDebugImporter >> initialize [
	super initialize.
	self reset
]

{ #category : #parsing }
FMDebugImporter >> primitive: value [

	tokens := tokens copyWith: (Array with: #primitive: with: value)
]

{ #category : #parsing }
FMDebugImporter >> referenceName: name [

	tokens := tokens copyWith: (Array with: #referenceName: with: name)
]

{ #category : #parsing }
FMDebugImporter >> referenceNumber: index [

	tokens := tokens copyWith:
		          (Array with: #referenceNumber: with: index)
]

{ #category : #accessing }
FMDebugImporter >> replayOn: aParseClient [

	tokens do: [ :each |
		aParseClient perform: each first withArguments: each allButFirst ]
]

{ #category : #initialization }
FMDebugImporter >> reset [

	tokens := #(  )
]

{ #category : #parsing }
FMDebugImporter >> serial: index [

	tokens := tokens copyWith: (Array with: #serial: with: index)
]

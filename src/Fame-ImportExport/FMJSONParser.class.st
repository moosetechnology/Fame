"
Description
--------------------

I am a parser responsible of the JSON syntax parsing. I do not manage the creation of the entities, this part is delegated to a `FMImporter`.
 
Unlike `FMMSEParser`, I do not support parsing properties without value.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
- buffer:				<aBuffer>				Buffer used to keep a record of the previously read characters during the parsing.
- characterSet:		<aCharacterSet>		A character set cached to speed up the reading of the JSON.
- chararacter:			<aCharacter>			The last character read on the stream.
- importer:				<aFMImporter>		The FMImporter responsible of the management of the entities to be imported.
- lastUpdate:			<anInteger>			Time in millisecond since the last progress bar update.
- progBar:				<aProgressBar>		A progress bar to display the parsing progress.
- stream:				<aStream>				The stream containing the JSON to be read.

"
Class {
	#name : #FMJSONParser,
	#superclass : #FMMSEParser,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #tokens }
FMJSONParser >> Document [
	"Matches a document node (returns a boolean)."

	"Document := EOF { openDocument; closeDocument }
		| OPEN { openDocument } Entity* CLOSE { closeDocument }"

	self tWHITESPACE.
	self atEnd
		ifTrue: [ importer beginDocument ]
		ifFalse: [" self tMultiOPEN
				ifFalse: [ ^ self syntaxError ]."
			importer beginDocument.
			self MultiEntity.
			"[ self Entity ] whileTrue.
			self tMultiCLOSE
				ifFalse: [ ^ self syntaxError ]" ].
	importer endDocument.
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Entity [
	"Matches an entity node (returns boolean)."

	"Entity := OPEN n:FULLNAME { beginElement(n) } Serial? Property* CLOSE { endElement(n) }"

	| pos name |
	pos := self position.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	name := self tFULLNAME.
	name ifNil: [ ^ self backtrack: pos ].
	self tPropertySeparator.
	importer
		inEntity: name
		do: [ self Serial.
			self tPropertySeparator.
			[ self Property ] whileTrue.
			self tCLOSE ifFalse: [ ^ self syntaxError ] ].
	self tWHITESPACE.

	self incrementProgressBar.	"UI stuff"
	^ true
]

{ #category : #tokens }
FMJSONParser >> MultiEntity [
	self tMultiOPEN
		ifFalse: [ ^ self backtrack: self position ].
	[ self Entity or: [ self Reference or: [ self Reference2 ] ].
	self incrementProgressBar.
	self tPropertySeparator ] whileTrue.
	self tMultiCLOSE
		ifFalse: [ ^ self syntaxError ].
	^ true
]

{ #category : #tokens }
FMJSONParser >> Property [
	"Matches a property node (returns boolean)."

	"Property := OPEN n:NAME { beginProperty(n) } Value* CLOSE { endProperty(n) }"

	| pos name |
	pos := self position.
	self tPropertyNameOPEN ifFalse: [ ^ self backtrack: pos ].
	name := self tNAME.
	self tPropertyNameClose ifFalse: [ ^ self backtrack: pos ].
	self tPropertyNameSeparator ifFalse: [ ^ self backtrack: pos ].
	name ifNil: [ ^ self backtrack: pos ].
	importer inProperty: name do: [ 
		[ self Value ] whileTrue.
		self tPropertyValueCLOSE ifFalse: [ ^ self syntaxError ] ].
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Reference [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Identifier { client referenceNumber: n } CLOSE"
	| position serial |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tREF ifFalse: [ ^ self backtrack: position ].
	self tPropertyNameSeparator ifFalse: [ ^ self backtrack: position ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: position ].
	importer referenceNumber: serial.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Reference2 [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Name { client referenceName: n } CLOSE"
	| position name |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tREF ifFalse: [ ^ self backtrack: position ].
	self tPropertyNameSeparator ifFalse: [ ^ self backtrack: position ].
	name := self String.
	name ifNil: [ ^ self backtrack: position ].
	importer referenceName: name.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Serial [
	"Matches a serial number node (returns boolean)."
	"Serial --> OPEN ID n:Identifier { client serial: n } CLOSE"
	| position serial |
	position := self position.
	self tID ifFalse: [ ^ self backtrack: position ].
	self tPropertyNameSeparator ifFalse: [ ^ self backtrack: position ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: position ].
	importer serial: serial.
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> String [

	| previousChar |
	"read a string"
	$" == chararacter ifFalse: [ ^ nil ].

	buffer reset.
	"read the string"
	[ 
	previousChar := chararacter.
	self next.
	chararacter ifNil: [ self syntaxError ].
	$" == chararacter and: [ $\ ~= previousChar ] ] whileFalse: [ ($\ ~= chararacter or: [ previousChar == $\ ]) ifTrue: [ buffer nextPut: chararacter ] ].
	"eat the last "" character"
	self next.
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #tokens }
FMJSONParser >> Value [

	"Matchs a value (returns true)."

	"Value := Reference | Primitive | Entity"

	^ self Primitive or: [ self Reference or: [ self Reference2 or: [ self MultiEntity or: [ self Entity ] ] ] ]
]

{ #category : #tokens }
FMJSONParser >> tCLOSE [
	^ self matchesWord: '}'
]

{ #category : #tokens }
FMJSONParser >> tFULLNAME [
	self tFULLNAMEPropertyOpen ifFalse: [ ^ nil ].
	self tPropertyNameSeparator ifFalse: [ ^ nil ].
	self tPropertyNameOPEN ifFalse: [ ^ nil ].
	buffer reset.
	[ 
	buffer nextPut: chararacter.
	[ self nextCharIsAlphanumeric or: [ chararacter ~= $" ] ] whileTrue: [ 
		buffer nextPut: chararacter ].
	$. == chararacter ] whileTrue: [ 
		buffer nextPut: chararacter.
		(self characterSet isLetter: self next) ifFalse: [ 
			^ self syntaxError ] ].
	$: == chararacter ifTrue: [ ^ self syntaxError ].
	self tFULLNAMEPropertyClose.
	^ buffer contents
]

{ #category : #tokens }
FMJSONParser >> tFULLNAMEPropertyClose [
	^ self matchesWord: '"'
]

{ #category : #tokens }
FMJSONParser >> tFULLNAMEPropertyOpen [
	^ self matchesWord: '"FM3"'
]

{ #category : #tokens }
FMJSONParser >> tID [
	"Match id keyword (returns boolean)."

	^ self matchesWord: '"id"'
]

{ #category : #tokens }
FMJSONParser >> tMultiCLOSE [
	^ self matchesWord: ']'
]

{ #category : #tokens }
FMJSONParser >> tMultiOPEN [
	^ self matchesWord: '['
]

{ #category : #tokens }
FMJSONParser >> tOPEN [
	^ self matchesWord: '{'
]

{ #category : #tokens }
FMJSONParser >> tPropertyNameClose [
	^ self matchesWord: '"'
]

{ #category : #tokens }
FMJSONParser >> tPropertyNameOPEN [
	^ self matchesWord: '"'
]

{ #category : #tokens }
FMJSONParser >> tPropertyNameSeparator [
	^ self matchesWord: ':'
]

{ #category : #tokens }
FMJSONParser >> tPropertySeparator [
	^ self matchesWord: ','
]

{ #category : #tokens }
FMJSONParser >> tPropertyValueCLOSE [
	^ (self matchesWord: ',') or: [ self matchesWord: ''  ]
]

{ #category : #tokens }
FMJSONParser >> tREF [
	"Matches ref keyword (returns boolean)."

	^ self matchesWord: '"ref"'
]

{ #category : #tokens }
FMJSONParser >> tWHITESPACE [
	^ [ self atEnd not and: [ chararacter isSeparator  ] ] whileTrue: [ self next ]
]

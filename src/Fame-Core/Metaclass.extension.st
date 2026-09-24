Extension { #name : 'Metaclass' }

{ #category : '*Fame-Core' }
Metaclass >> isMetamodelEntity [
	^ self metamodelDefinitionPragma isNotNil
]

{ #category : '*Fame-Core' }
Metaclass >> metamodelDefinitionPragma [
	"We take into account only pragmas that are in my methods and not methods from my traits."

	^ ((Pragma allNamed: #FMClass:super: in: self) select: [ :pragma | pragma method origin = self ]) ifEmpty: [ nil ] ifNotEmpty: [ :pragmas |
			  pragmas size = 1 ifFalse: [ self error: 'It should not be possible to have two pragmas to define a FM3 class.' ].
			  pragmas anyOne ]
]

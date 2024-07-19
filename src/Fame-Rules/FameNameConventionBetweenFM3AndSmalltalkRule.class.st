"
Check (for a class metadescribed with FM3 pragmas) if the FM3 class generated respect the convention between FM3 and Smalltalk:

A FM3 class should be named PACKAGE.CLASSNAME whereas the smalltalk class associated should  be named PACKAGECLASSNAME. It is also an error to declare a FM3 meta-description without a package.
"
Class {
	#name : #FameNameConventionBetweenFM3AndSmalltalkRule,
	#superclass : #ReAbstractRule,
	#category : #'Fame-Rules'
}

{ #category : #testing }
FameNameConventionBetweenFM3AndSmalltalkRule class >> checksClass [

	^ true
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule class >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule class >> ruleName [

	^ 'FM3 class doesnt respect the fame name convention between FM3 and Smalltalk '
]

{ #category : #accessing }
FameNameConventionBetweenFM3AndSmalltalkRule class >> uniqueIdentifierName [
	^ 'NameConventionBetweenFM3AndSmalltalk'
]

{ #category : #running }
FameNameConventionBetweenFM3AndSmalltalkRule >> basicCheck: aClass [

	| class |
	class := aClass isClassSide
		         ifTrue: [ aClass ]
		         ifFalse: [ aClass class ].
	^ (Pragma allNamed: #FMClass:super: in: class) ifEmpty: [ ^ false ] ifNotEmpty: [ :pragmas |
		  pragmas size > 1 ifTrue: [ ^ true ].

		  (pragmas first method pragmaAt: #package:)
			  ifNotNil: [ :packagePragma |
				  | metaName |
				  metaName := pragmas first argumentAt: 1.
				  (packagePragma argumentAt: 1) , metaName ~= aClass instanceSide name ]
			  ifNil: [ "this happens if the package: pragma is missing" true ] ]
]

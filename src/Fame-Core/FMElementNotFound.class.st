"
An error thrown when Fame looks for a given element in a model and does not find it
"
Class {
	#name : #FMElementNotFound,
	#superclass : #Error,
	#instVars : [
		'element'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #accessing }
FMElementNotFound >> element [

	^ element
]

{ #category : #accessing }
FMElementNotFound >> element: anObject [

	element := anObject
]

{ #category : #accessing }
FMElementNotFound >> messageText [
	^'Element ''' , element asString , ''' not found'
]

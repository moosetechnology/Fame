"
An error thrown when Fame looks for a given element in a model and does not find it
"
Class {
	#name : #FameElementNotFound,
	#superclass : #Error,
	#instVars : [
		'element'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #accessing }
FameElementNotFound >> element [

	^ element
]

{ #category : #accessing }
FameElementNotFound >> element: anObject [

	element := anObject
]

{ #category : #accessing }
FameElementNotFound >> messageText [
	^'Element ''' , element asString , ''' not found'
]

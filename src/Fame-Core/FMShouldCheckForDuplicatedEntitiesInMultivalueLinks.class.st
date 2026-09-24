"
## Description

I am a dynamic variable used by implementations of multivalue links to know if we should check for duplicated entities in multivalue links.

For example, when importing a json, we are sure we will never add two times the same entity to a multivalue link. 

I exist for performance reason because the cost of checking for duplicated entities is high. 

By default I will enable the check.

## Usage

```smalltalk
FMShouldCheckForDuplicatedEntitiesInMultivalueLinks value: false during: [ self importModel ]
```
"
Class {
	#name : 'FMShouldCheckForDuplicatedEntitiesInMultivalueLinks',
	#superclass : 'DynamicVariable',
	#category : 'Fame-Core-Utilities',
	#package : 'Fame-Core',
	#tag : 'Utilities'
}

{ #category : 'accessing' }
FMShouldCheckForDuplicatedEntitiesInMultivalueLinks >> default [

	^ true
]

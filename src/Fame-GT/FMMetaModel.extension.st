Extension { #name : #FMMetaModel }

{ #category : #'*Fame-GT' }
FMMetaModel >> gtInspectorClassesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastList
		title: 'Classes';
		display: [ self classes sorted: [ :x :y | x fullName < y fullName ] ];
		format: [ :each | each isAbstract ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ] ifFalse: [ Text fromString: each fullName ] ];
		tags: [ :each | each package ifNil: [ #() ] ifNotNil: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation'
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtInspectorHierarchiesIn: composite [
	<gtInspectorPresentationOrder: 3>
	^ composite tree
		title: 'Hierarchies';
		display: [ (self classes select: [ :each | each superclass = FM3Object instance ]) sorted: [ :x :y | x fullName < y fullName ] ];
		children: [ :c | c subclasses sorted: [ :x :y | x fullName < y fullName ] ];
		format: [ :each | 
			each isAbstract
				ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				ifFalse: [ Text fromString: each fullName ] ];
		tags: [ :each | 
			each package
				ifNil: [ #() ]
				ifNotNil: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation'
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtInspectorPackagesIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite fastList
		title: 'Packages';
		display: [ self packages sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | each fullName ]
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtInspectorPropertiesIn: composite [
	<gtInspectorPresentationOrder: 5>
	^ composite table
		title: 'Properties';
		display: [ self properties sorted: [ :x :y | x fullName < y fullName ] ];
		column: 'Name'
			evaluated: [ :each | each gtDisplayString ]
			tags: [ :each | 
			each package
				ifNil: [ #() ]
				ifNotNil: [ each package name ] ];
		column: 'Type' evaluated: [ :each | each gtTypeString ];
		column: 'derived?' evaluated: [ :each | each isDerived ] width: 50;
		column: 'Comment' evaluated: #comment;
		morphicSelectionAct: [ :list | list selection implementingClass browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation'
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtInspectorTraitsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastList
		title: 'Traits';
		display: [ self traits sorted: [ :x :y | x fullName < y fullName ] ];
		format: [ :each | each isAbstract ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ] ifFalse: [ Text fromString: each fullName ] ];
		tags: [ :each | each package ifNil: [ #() ] ifNotNil: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation'
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtSpotterClassesFor: aStep [
	<spotterOrder: 10>
	aStep listProcessor
		title: 'Classes';
		allCandidates: [ self classes ];
		itemName: [ :class | class fullName ];
		filter: GTFilterSubstring
]

{ #category : #'*Fame-GT' }
FMMetaModel >> gtSpotterPackagesFor: aStep [
	<spotterOrder: 20>
	aStep listProcessor
		title: 'Packages';
		allCandidates: [ self packages ];
		itemName: [ :example | example fullName ];
		filter: GTFilterSubstring
]

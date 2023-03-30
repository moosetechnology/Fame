Extension { #name : #FMMetaModel }

{ #category : #'*Fame-Spec2' }
FMMetaModel >> stFmInspectorClasses: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Classes'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Class' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  items: self classes;
		  yourself
]

{ #category : #'*Fame-Spec2' }
FMMetaModel >> stFmInspectorHierarchies: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Hierarchies'>
	^ aBuilder newTree
		  roots: (self classes select: [ :each | each superclass = FM3Object instance ]);
		  children: [ :c | c subclasses ];
		  display: [ :each | 
			  each isAbstract
				  ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				  ifFalse: [ Text fromString: each fullName ] ];
		  yourself
]

{ #category : #'*Fame-Spec2' }
FMMetaModel >> stFmInspectorPackages: aBuilder [

	<inspectorPresentationOrder: 2 title: 'Packages'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Package' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  items: self packages;
		  yourself
]

{ #category : #'*Fame-Spec2' }
FMMetaModel >> stFmInspectorProperties: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each stFmTypeString ]);
		  addColumn: (SpStringTableColumn title: 'Derived?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isDerived ]);
		  addColumn: (SpStringTableColumn title: 'Comment' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self properties;
		  yourself
]

{ #category : #'*Fame-Spec2' }
FMMetaModel >> stFmInspectorTraits: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Traits'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Trait' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  items: self traits;
		  yourself
]

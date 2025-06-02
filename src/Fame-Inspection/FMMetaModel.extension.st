Extension { #name : #FMMetaModel }

{ #category : #'*Fame-Inspection' }
FMMetaModel >> inspectionClasses: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Classes'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Class'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  items: self classes;
		  sortingBlock: #fullName ascending;
		  yourself
]

{ #category : #'*Fame-Inspection' }
FMMetaModel >> inspectionHierarchies: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Hierarchies'>
	^ aBuilder newTree
		  roots:
			  (self classes select: [ :each |
					   each superclass = FM3Object instance ]);
		  children: [ :c | c subclasses ];
		  display: [ :each |
			  each isAbstract
				  ifTrue: [
					  Text string: each fullName attribute: TextEmphasis italic ]
				  ifFalse: [ Text fromString: each fullName ] ];
		  yourself
]

{ #category : #'*Fame-Inspection' }
FMMetaModel >> inspectionPackages: aBuilder [

	<inspectorPresentationOrder: 2 title: 'Packages'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Package'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  items: self packages;
		  sortingBlock: #fullName ascending;
		  yourself
]

{ #category : #'*Fame-Inspection' }
FMMetaModel >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Name'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Type'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each inspectionTypeString ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Derived?'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each isDerived ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Comment'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self properties;
		  sortingBlock: #fullName ascending;
		  beResizable;
		  yourself
]

{ #category : #'*Fame-Inspection' }
FMMetaModel >> inspectionTraits: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Traits'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Trait'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  items: self traits;
		  sortingBlock: #fullName ascending;
		  yourself
]

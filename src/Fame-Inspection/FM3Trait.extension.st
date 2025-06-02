Extension { #name : #FM3Trait }

{ #category : #'*Fame-Inspection' }
FM3Trait >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Properties'>
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
		  items: self allPrimitiveProperties;
		  sortingBlock: #fullName ascending;
		  beResizable;
		  yourself
]

{ #category : #'*Fame-Inspection' }
FM3Trait >> inspectionRelations: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Relations'>
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
				   title: 'Container?'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each isContainer ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'isTarget?'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each isTarget ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'isSource?'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each isSource ])
				  beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Comment'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self allComplexProperties;
		  sortingBlock: #fullName ascending;
		  beResizable;
		  yourself
]

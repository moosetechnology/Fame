Extension { #name : 'FM3Class' }

{ #category : '*Fame-Inspection' }
FM3Class >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Properties'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Name'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  addColumn:
			  (SpStringTableColumn title: 'Type' evaluated: [ :each |
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

{ #category : '*Fame-Inspection' }
FM3Class >> inspectionRelations: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Relations'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  addColumn: ((SpStringTableColumn title: 'Type' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each inspectionTypeString ]) beSortable
				   width: 160;
				   yourself);
		  addColumn: ((SpStringTableColumn title: 'Derived?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isDerived ])
				   beSortable;
				   width: 80;
				   yourself);
		  addColumn: ((SpStringTableColumn title: 'Container?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isContainer ]) beSortable
				   width: 80;
				   yourself);
		  addColumn: ((SpStringTableColumn title: 'isTarget?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isTarget ]) beSortable
				   width: 80;
				   yourself);
		  addColumn: ((SpStringTableColumn title: 'isSource?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isSource ]) beSortable
				   width: 80;
				   yourself);
		  addColumn: (SpStringTableColumn title: 'Comment' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self allComplexProperties;
		  sortingBlock: #fullName ascending;
		  beResizable;
		  yourself
]

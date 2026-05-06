Extension { #name : 'FM3Type' }

{ #category : '*Fame-Inspection' }
FM3Type >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Properties'>
	^ aBuilder newTable
		  addColumn: ((SpStringTableColumn
				    title: 'Name'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom: each name ])
				   beSortable;
				   width: 160;
				   yourself);
		  addColumn:
			  ((SpStringTableColumn
				    title: 'Expected type'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom:
							    each inspectionTypeString ]) beSortable
				   width: 100;
				   yourself);
		  addColumn: ((SpImageTableColumn
				    title: 'Derived?'
				    evaluated: [ :each |
					    each isDerived ifTrue: [ aBuilder iconNamed: #smallOk ] ])
				   sortFunction: [ :each | each isDerived ] descending;
				   width: 60;
				   yourself);
		  addColumn:
			  ((SpStringTableColumn title: 'Comment' evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom:
							    (each comment ifNil: [ '' ]) ])
				   width: 550;
				   yourself);
		  addColumn: ((SpStringTableColumn
				    title: 'Owner'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom: each owner fullName ])
				   beSortable;
				   yourself);
		  items: self allPrimitiveProperties;
		  sortingBlock: #name ascending;
		  beResizable;
		  yourself
]

{ #category : '*Fame-Inspection' }
FM3Type >> inspectionRelations: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Relations'>
	^ aBuilder newTable
		  addColumn: ((SpStringTableColumn
				    title: 'Name'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom: each name ])
				   beSortable;
				   width: 160;
				   yourself);
		  addColumn:
			  ((SpStringTableColumn
				    title: 'Expected type'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom:
							    each inspectionTypeString ]) beSortable
				   width: 160;
				   yourself);
		  addColumn:
			  ((SpStringTableColumn
				    title: 'Relation type'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom:
							    each inspectionRelationTypeString ]) beSortable
				   width: 100;
				   yourself);
		  addColumn: ((SpImageTableColumn
				    title: 'Multivalued?'
				    evaluated: [ :each |
					    each isMultivalued ifTrue: [ aBuilder iconNamed: #smallOk ] ])
				   sortFunction: [ :each | each isMultivalued ] descending;
				   width: 85;
				   yourself);
		  addColumn: ((SpImageTableColumn
				    title: 'Derived?'
				    evaluated: [ :each |
					    each isDerived ifTrue: [ aBuilder iconNamed: #smallOk ] ])
				   sortFunction: [ :each | each isDerived ] descending;
				   width: 60;
				   yourself);
		  addColumn:
			  ((SpStringTableColumn title: 'Comment' evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom:
							    (each comment ifNil: [ '' ]) ])
				   width: 550;
				   yourself);
		  addColumn: ((SpStringTableColumn
				    title: 'Owner'
				    evaluated: [ :each |
					    StObjectPrinter asTruncatedTextFrom: each owner fullName ])
				   beSortable;
				   yourself);
		  items: self allComplexProperties;
		  sortingBlock: #name ascending;
		  beResizable;
		  yourself
]

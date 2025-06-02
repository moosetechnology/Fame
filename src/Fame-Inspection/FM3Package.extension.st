Extension { #name : #FM3Package }

{ #category : #'*Fame-Inspection' }
FM3Package >> inspectionClasses: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Classes'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Class'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  items: self classes asOrderedCollection;
		  sortingBlock: #fullName ascending;
		  yourself
]

{ #category : #'*Fame-Inspection' }
FM3Package >> inspectionExtensions: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Extensions'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn
				   title: 'Extensions'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each fullName ])
				  beSortable;
		  items: self extensions asOrderedCollection;
		  sortingBlock: #fullName ascending;
		  yourself
]

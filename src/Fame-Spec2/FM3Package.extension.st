Extension { #name : #FM3Package }

{ #category : #'*Fame-Spec2' }
FM3Package >> stFmInspectorClasses: aBuilder [

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

{ #category : #'*Fame-Spec2' }
FM3Package >> stFmInspectorExtensions: aBuilder [

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

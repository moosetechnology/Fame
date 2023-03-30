Extension { #name : #FM3Class }

{ #category : #'*Fame-Spec2' }
FM3Class >> stFmInspectorProperties: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Properties'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each stFmTypeString ]);
		  addColumn: (SpStringTableColumn title: 'Derived?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isDerived ]);
		  addColumn: (SpStringTableColumn title: 'Comment' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self allPrimitiveProperties;
		  yourself
]

{ #category : #'*Fame-Spec2' }
FM3Class >> stFmInspectorRelations: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Relations'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each fullName ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each stFmTypeString ]);
		  addColumn: (SpStringTableColumn title: 'Derived?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isDerived ]);
		  addColumn: (SpStringTableColumn title: 'Container?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isContainer ]);
		  addColumn: (SpStringTableColumn title: 'isTarget?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isTarget ]);
		  addColumn: (SpStringTableColumn title: 'isSource?' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each isSource ]);
		  addColumn: (SpStringTableColumn title: 'Comment' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each comment ]);
		  items: self allComplexProperties;
		  yourself
]

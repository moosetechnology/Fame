Extension { #name : #FM3Element }

{ #category : #'*Fame-Inspection' }
FM3Element >> inspectionComment: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Comment'>
	^ aBuilder newText
		  text: self comment;
		  yourself
]

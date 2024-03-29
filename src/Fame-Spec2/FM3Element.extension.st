Extension { #name : #FM3Element }

{ #category : #'*Fame-Spec2' }
FM3Element >> stFmInspectorComment: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Comment'>
	^ SpTextPresenter new
		  text: self comment;
		  yourself
]

{ #category : #'*Fame-Spec2' }
FM3Element >> stFmInspectorCommentContext: aContext [

	aContext active: self hasComment
]

accessing
shortName
	"Answers the more colloquial branch name without refs/heads or refs/remotes/."
	| shortHeadRef shortRemoteRef |
	(referenceName beginsWith: 'refs/heads/')
		ifTrue: [shortHeadRef := referenceName allButFirst: 'refs/heads/' size.
			(self git refExists: shortHeadRef)
				ifFalse: [^ shortHeadRef]].
	(referenceName beginsWith: 'refs/remotes/')
		ifTrue: [shortRemoteRef := referenceName allButFirst: 'refs/remotes/' size.
			(self git refExists: 'refs/heads/', shortRemoteRef)
				ifFalse: [^ shortRemoteRef]].
	^ referenceName
patching
applyPatch: aPatch
	aPatch applyTo: self displayingProgress: [:each | 'Updating objects... ', each].
	self loadOrder removeAllSuchThat: [:each | (objects includesKey: each) not].
	self flag: #notLoadedArtifacts. "when artifacts can be loaded optionally, the not loaded ones must not be removed from the load order above"
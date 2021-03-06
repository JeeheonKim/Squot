tests
testLoadExistingFilesFromRevision
	self createSomeCommits.
	self withUnitOfWork: [:git |
	workingCopy := workingCopy parents first.
	
	self assert: (workingCopy root / 'file1') exists.
	self deny: (workingCopy root / 'dir1') exists.
	self deny: (workingCopy root / 'dir1' / 'file2') exists.
	].
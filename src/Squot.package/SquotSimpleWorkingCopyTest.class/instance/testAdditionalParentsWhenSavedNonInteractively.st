tests
testAdditionalParentsWhenSavedNonInteractively
	| text firstVersion secondVersion thirdVersion |
	"given"
	firstVersion := (workingCopy
		add: (text := Text fromString: 'example') at: 'some-text';
		newSaveOperation) message: 'first version'; applyToWorkingCopy.
	text append: ' 1'.
	secondVersion := workingCopy newSaveOperation message: 'append 1'; applyToWorkingCopy.
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'example' equals: text string.
	"when"
	workingCopy addParentVersion: secondVersion.
	text append: ' 2'.
	thirdVersion := workingCopy newSaveOperation message: 'append 2'; applyToWorkingCopy.
	"then"
	self assert: thirdVersion parents size = 2.
	self assert: thirdVersion parents asSet = (Set with: firstVersion with: secondVersion).
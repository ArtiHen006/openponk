initialization
initializeWidgets
"	statusModel := self newText."
	roassalModel := self instantiate: RoassalModel.
"	formModel := self instantiate: DCForm."
	paletteModel := self instantiate: DCPaletteModel.
	"self selectFsmPalette."
	(self focusOrder)
		add: roassalModel;
		add: paletteModel;
		add: formModel;
		add: statusModel
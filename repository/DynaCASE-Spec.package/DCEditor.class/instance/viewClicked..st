as yet unclassified
viewClicked: anEvent
	| element |
	selectedItem
		ifNotNil: [ 
			element := selectedItem createElement.
			selectedItem button state: false.
			selectedItem := nil.
			element translateTo: anEvent position.
			element @ RTDraggable.
			element
				on: TRMouseLeftClick
				do: [ :event | self elementClicked: event ].
			roassalView add: element.
			roassalView signalUpdate ]
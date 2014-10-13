interaction
activationView
	^ activationView
		ifNil: [ 
			activationView := RTBox new
				color: Color transparent;
				element.
			DCTRConstraint keepExtentOf: activationView like: self view plus: 2 @ 2.
			TRConstraint stick: activationView onTheCenterOf: self view.
			self view
				when: TRMouseEnter
				do: [ :event | 
					self activateLevel: 10 color: Color gray.
					activationView signalUpdate ].
			self view
				when: TRMouseLeave
				do: [ :event | 
					self deactivateLevel: 10.
					activationView signalUpdate ].
			activationView ]
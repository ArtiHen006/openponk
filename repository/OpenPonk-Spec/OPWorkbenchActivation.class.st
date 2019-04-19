"
I mark commands used in the Workbench toolbar -- project, editor, etc.
"
Class {
	#name : #OPWorkbenchActivation,
	#superclass : #CmdMenuCommandActivationStrategy,
	#category : #'OpenPonk-Spec-Commands'
}

{ #category : #accessing }
OPWorkbenchActivation >> menuItemNameFor: aCommand [
	^ menuItemName ifNil: [ aCommand defaultMenuItemName ]
]
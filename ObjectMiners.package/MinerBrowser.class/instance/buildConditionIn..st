configuration pane - configuration
buildConditionIn: tab
	tab transmit
		to: #condition;
		andShow: [ :a :cond | 
			| script |
			script := a pharoScript.
			script
				title: 'Condition';
				smalltalkClass: [ Object ];
				variableBindings: [ minerConfiguration context
						collect: [ :reif | reif -> reif ] ];
				display: (minerConfiguration condition source ifNil: [ '' ]);
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					minerConfiguration condition source: src.
					thePane clearUserEdits.
					minerConfiguration
						compileCondition.
					a update ]
					on: $s
					entitled: 'Accept' ]. self flag: 'Refresh bindings on a change in context'
{
	arg model, parent=FlowView(), envir=currentEnvironment;
	var cGui=ProtoG.constructGui;
	(
		hook:{arg s,view;
			("'"++s.model.asString
				++"' constructed as "++view.class
				++" with specs : "++try{view.controlSpec}
			).postln},

		model:model.asSymbol,
		envir:envir,
		fen:parent,
		
		go:{arg s;
			var gui;
			s.use{
				var f=~fen??{FlowView()};
				// we instantiate gui Class
				s.view=s[\gui]
				.valueIfNeeded(s) //used to guess gui from val
				// avoiding confusion with object rewriting 'value'
				.new(f,~bounds);
				cGui.putAll(
					(~opt.value(s)?()),
					s[\gui][\opt] ? ()
				)
				.proto_(s)
				.construct(s.view);
			};
			s.gui
		}
	) %= ProtoG.defaultGui

}


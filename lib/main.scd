{
	arg model, parent=FlowView(), envir=currentEnvironment;
	var cGui=ProtoG.constructGui;
	(
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
				)
				.proto_(s)
				.construct(s.view);
			};
			s
		}
	) %= ProtoG.defaultGui(model)

}


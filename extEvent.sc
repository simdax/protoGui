// proxy


ProtoGui{

	classvar <envir, <parent;
	classvar <instances=0;
	*push{
		parent ?? {parent=FlowView(bounds:Rect(1000, 800, 400,400)).parent.alwaysOnTop_(true)};
		envir.push
	}
	*pop{
		ProtoGui.envir.pop
	}
	*new{ 	arg name, par=parent;
		if(name.isNil){name=(instances+97).asAscii.asSymbol;
			instances=instances+1}; 
		^(constructGui:
			(
				action:{ arg s;
					{arg self;
						var res=s[\valAction].value(self.value);
						~envir.localPut(~model,self.value)
					}.inEnvir(s)
				}).parent_((
					initVal:0,
					val:{arg s;  s.use{
						(~envir.at(~model).value) ? ~initVal
					}},
					model:name.asSymbol,
					envir:ProtoGui.envir, //currentEnvironment
					valAction:{arg res; res},//{	arg res; if(~spec.notNil){~spec.map(res)}{res}; res },
					construct:{ arg s, view;
						s.keys.do { |x| 
							view.perform(x.asSetter,s[x].value(s));
						};
						view.value_(s.val);
						s[\hook].value(view)
					})
				),
		gui:Slider,
		fen:par,
		go:{arg s;
			var gui;
			s.use{
				var f=~fen??{FlowView()};
				gui=~gui.new(f,~bounds);
				~constructGui.copy.putAll((~opt?()))
				.proto_(s)
				.construct(gui);
			};
			//z.put(name,s.view);
			gui
		});
	}

	*initClass{
		envir=LazyEnvir();		
	}
}

+ Event{
	// override to have more plasticity
	localPut{arg key,val;
		this.put(key,val)
	}
	%={arg dest;
		^(dest.parent_(this))
	}
	=%{ arg that;
		^this.parent_(that)
	}
}

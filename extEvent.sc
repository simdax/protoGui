// proxy


ProtoGui{

	classvar <envir, <parent;
	classvar <instances=0;
	*push{
		parent=FlowView().parent.alwaysOnTop_(true);
		envir.push
	}
	*new{ arg name;
		if(name.isNil){name=(instances+97).asAscii.asSymbol; instances=instances+1};
		^(constructGui:
			(
				model:name,
				envi:ProtoGui.envir,				
				value:{arg s; s.use{
					~envi.at(~model).value ? 0
				}},
				action:{ arg s;
					{arg self;
						//var res=s[\valAction].postln.value(self.value);
						s.postln;
						//	~envi.put(~model,res)
					}
				}).parent_((
					valAction:{	arg res; if(~spec.notNil){~spec.map(res)}{res} },
					construct:{ arg s, ss;
						s.keys.do { |x| 
							ss.view.perform(x.asSetter,s[x].value(s))
						};
						//~hook.value(view)
					})
				),
			gui:Slider,
			go:{arg s, p=parent, b;
				s.use{
					s.view=~gui.new(p,b);
					~constructGui.putAll(~addCG).construct(s);
					// SimpleController(~model.value).put(\val,
					// 	{ arg qui,que,quoi;
					// 		~gui.value_(
					// 			if(~spec.notNil)
					// 			{~spec.unmap(quoi)}
					// 			{quoi}
					// 		)
					// 	}	
				};
				s	
			})
	}

	*initClass{

		envir=LazyEnvir();		

		StartUp.add{

			~protoGui=
			(
				constructGui:(
					value:{arg s; s.postln; s.use{
						~envi.postln;
						~envi.at(~model.value)
					}},
					action:{ arg s;
						{arg self; var res=self.value;
							~envir.put(~model,
								if(~spec.notNil){~spec.map(res)}{res})
						}.inEnvir(s)
					}).parent_((
						construct:{ arg s, ss;
							ss.use{
								ss.postln;
								s.keys.do { |x| x.postln;
									~view.perform(
										x.asSetter,s[x].value(ss))
								}};
							//~hook.value(view)
						})
					),
				envi:ProtoGui.envir,
				gui:Slider,
				go:{arg s, p=FlowView(),b;
					s.use{
						s.postln;
						s.view=~gui.new(p,b);
						~constructGui.putAll(~addCG).construct(s);
						SimpleController(~model.value).put(\val,
							{ arg qui,que,quoi;
								~gui.value_(
									if(~spec.notNil)
									{~spec.unmap(quoi)}
									{quoi}
								)
							}
						)
					};
					s
				}
			)

		}
	}
}

+ Event{
	%={arg dest;
		^(dest.parent_(this))
	}
	=%{ arg that;
		^this.parent_(that)
	}
}

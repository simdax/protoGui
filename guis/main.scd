(
(
range:[0,5], round:1
).parent_(
	(
		val:[0,3,4],
		specs:(range:[0,10],round:\unipolar),
		go:{arg s; var routine;
			s.use
			{~range=[~val.minItem,~val.maxItem];
				~msv.value_(~range.asSpec.unmap(~val)).front;
				~msv.mouseDownAction_{arg msv;
					msv.step(s.round);
					[routine,s.stringRoutine].do(_.pause);
				}
				.mouseMoveAction_({ arg msv;
					~text.string_(
						~range.asSpec.unmap(msv.value[msv.index])
					)
				}.inEnvir(s))				
				.mouseUpAction_{ arg msv;
					s.val=s.range.asSpec.step_(s.round).map(s.msv.value);
					[routine,s.stringRoutine].do(_.resume);
					}
			};
			routine=Task({
				var anc=s.range;
				loop{
					if(
						true, {
							s.msv.value_(
								s.range.asSpec.unmap(s.val)
							);
						});
					0.01.wait
				}
			},AppClock).play
		},
		makeGui:(
			init:{ arg s, win,envir;
				s.win=win.parent; 
				s.parent_(s.objects(envir));
				s.stringRoutine.play;
				s
			},
			objects:{arg s,ss; (
				button1:Button(s.win)
				.action_({~val=~val.add(~val.median)}.inEnvir(ss)),
				button2:Button(s.win)
				.action_({~val=~val.drop(-1)}.inEnvir(ss)),
				text:StaticText(s.win, 300@30),
				stringRoutine:Task({loop{s.text.string_(ss.val);
					0.1.wait}},AppClock),
			)},
		),
		gui:{arg s;
			var t=MyEnvirGui(s,3); t.parent.bounds_(300@350);
			s.parent.putAll(
				s.makeGui.init(t,s).parent,
				(msv:MultiSliderView(t.parent,280@200).elasticMode_(true)));
			s.go; 
			s
		}
	)
).copy;
)


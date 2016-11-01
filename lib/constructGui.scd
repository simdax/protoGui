//constructGui:
{
	(
		action:{ arg s;
			{
				~envir.put(~model,~view.value.postln)
			}.inEnvir(s)
		}).parent_((
			construct:{ arg s, view;
				s.keys.do { |x|
					if(view.class==Event){
						view.win
					}{view}
					.perform(x.asSetter,s[x].value(s));
				};
				view.value_(s.initVal);
				view.doAction; //if envir is empty
				s.hook(view)
			})
		)
}
//constructGui:
{
	(
		action:{ arg s;
			{
				~envir.localPut(~model,~view.value)
			}.inEnvir(s)
		}).parent_((
			info:{arg s,view;
				("'"++s.model.asString
					++"' constructed as "++view.class
					++" with specs : "++try{view.controlSpec}
				).postln},
			construct:{ arg s, view;
				s.keys.do { |x|
					// TODO : design trick...
					// if(view.parent!==GUIS.parent){
					// 	view.win
					// }{view}
					view.perform(x.asSetter,s[x].value(s));
				};
				view.value_(s.initVal);
				view.doAction; //if envir is empty
				s.hook(view);
				s.info(view);
			})
		)
}
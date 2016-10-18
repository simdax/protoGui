/*
a=MSVPlus(nil, 200@200).front
a.action_{"io".postln}
a.buttons
*/

MSVPlus : View{

	var <msv, <buttons, <indicateur;
	*new{ arg p=FlowView(), b;
		^super.new(p, b)
		.minWidth_(360) // ctrlSpec EZRanger un peu gourmand ?
		.minHeight_(150)	
		.init
	}
	doesNotUnderstand{ arg op ... args;
		^msv.perform(op, *args)
	}
	init{
		var specView=View(); specView.addFlowLayout;
		specView
		.background_(Color.rand)
		.minWidth_(this.bounds.width)
		.minHeight_(20)
		;
		msv=MSV(); msv.addDependant(this);
		(
			clip:[msv.spec.minval,msv.spec.maxval],
			range:[msv.spec.minval,msv.spec.maxval]
		)
		.parent_((specs:(range:[0,6,nil,1])))
		.gui(2,specView)
		.addAction(\range, {arg s;msv.spec=s.value})
		;

		this.layout_(
			VLayout(
				View().layout_(
					VLayout(
						specView,
						indicateur=StaticText().background_(Color.rand)
					).margins_(0).spacing_(0),
				).fixedHeight_(60)
				, msv,
				HLayout(
					*[
					["+", \add, msv.spec.range/2, Color.green],
					["-", \drop, (-1), Color.red]
					].collect({|x|
						var b=(
							Button().states_([
								[x[0], Color.black,  x[3]]
							])
							.action_{
								msv.value_(	msv.value.perform(x[1], x[2]));
							});
						buttons=buttons.add(b);
						b					
					})
				)
			).margins_(0)
		)
	}
	update{ arg qui, que ... quoi;
		//		qui.hash.postln; msv.hash.postln;
		// switch(qui,
		// 	msv, {
		switch(que,
			\value, {
				indicateur
				.string_(quoi[0].asString)
			}
		)
				//})
	}
}
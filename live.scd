
ProtoGui.envir.clear;
z=nil;
n=0;
p=FlowView();
y=();
z=();
ProtoGui.envir.dispatch={ arg k,v;
	z[k].value_(v)
};

{
	arg name, parent=p;
	//	if(name.isNil){name=(n+97).asAscii.asSymbol; n=n+1}; name.postln;
	a=(constructGui:
			(
				value:{arg s;  s.use{
					(~envir.at(~model).value) ? ~initVal
				}
				},
				action:{ arg s;
					{arg self;
						var res=s[\valAction].value(self.value);
						~envir.localPut(~model,self.value)
					}.inEnvir(s)
				}).parent_((
					initVal:0,
					model:name.asSymbol,
					envir:ProtoGui.envir,
					valAction:{arg res; res},//{	arg res; if(~spec.notNil){~spec.map(res)}{res}; res },
					construct:{ arg s, view;
						s.keys.do { |x| 
							view.perform(x.asSetter,s[x].value(s));
						};
						s[\hook].value(view)
					})
				),
		gui:Slider,
		fen:ProtoGui.parent,
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
}.value;

c= a%=(envir:y,model:\bob, gui:EZNumber, opt:(controlSpec:\unipolar.asSpec));
c.go

y=();


r=FlowView(windowTitle:"iooooooo");
b= a%=( envir:y, fen:r, bounds:100@100, model:\io,gui:MultiSliderView, initVal:[1,1,1],
	opt:(
		elasticMode:true
	)
); 
b.go

a=MultiSliderView.new(r,30@30)

d= a%=( gui:EnvelopeView,
	hook:{arg v; v.setEnv(ProtoGui.envir[\a].value)})   ;
d.go



/////////////// suite


e=(io:5, gui:{arg s;
c= a%=( envir:s, model:\io, gui:EZNumber, opt:(controlSpec:\unipolar.asSpec));
c.go
}); e.gui

~grosOuf=(
	gui:{arg s;
		var fen=FlowView();
		s.keys.postln.collect{ arg x;
			(a%=( envir:s, fen:fen, model:x.asSymbol, gui:EZNumber, opt:(controlSpec:\unipolar.asSpec)))
			.go;
		};
	}
);


y=(i:0, a:7, d:4).parent_(~grosOuf)


(
(a:9, b:10, c:[10, 2, 3])
)
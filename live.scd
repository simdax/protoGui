
ProtoGui.envir.clear;
n=0;
p=FlowView();
z=();
ProtoGui.envir.dispatch={ arg k,v;
	z[k].value_(v)
};

{
	var name, parent=p;
	a=(constructGui:
			(
				value:{arg s; s.postln; s.use{
					(~envir.at(~model).value).postln ? 0
				}
				},
				action:{ arg s;
					{arg self;
						var res=s[\valAction].value(self.value);
						~envir.put(~model,self.value)
					}.inEnvir(s)
				}).parent_((
					model:
					if(name.isNil){name=(n+97).asAscii.asSymbol; n=n+1},
					envir:ProtoGui.envir,
					valAction:{arg res; res},//{	arg res; if(~spec.notNil){~spec.map(res)}{res}; res },
					construct:{ arg s, ss;
						s.keys.postln.do { |x| 
							ss[\view].perform(x.asSetter,s[x].value(s));
						};
						s[\hook].value(ss[\view])
					})
				),
			gui:Slider,
			go:{arg s, pp=p, b;
				s.use{
					s.view=~gui.new(pp,b);
					~constructGui.copy.putAll((~opt?()))
					.proto_((hook:~hook))
					.construct(s);
				};
				z.put(name,s.view);
				s	
			});	
}.value;


c= a%=( gui:EZNumber, opt:(controlSpec:\unipolar.asSpec));
c.go

b= a%=( gui:MultiSliderView);
b.go

d= a%=( gui:EnvelopeView,
	hook:{arg v; v.setEnv(ProtoGui.envir[\a].value)})   ;
d.go


ProtoGui.push
ProtoGui.envir.put(\b, 299)

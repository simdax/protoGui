

p=FlowView();
a=ProtoG.main(\rien,p);



y=();
c= a%=(envir:y,model:\bob, gui:EZNumber, opt:(controlSpec:\unipolar.asSpec), initVal:0.2);
c.go

y=(bob:76)
c= a%=(envir:y,model:\bob, gui:EZNumber, opt:(controlSpec:[0,100].asSpec));
c.go

// without controlSpec
y=(bob:22)
c= a%=(envir:y,model:\bob, gui:EZNumber);
c.go

// without envir
~bob=1
c= a%=(model:\bob, gui:EZNumber);
c.go

~bob=33
c= a%=(model:\bob);
c.go


// test with class call

~bob=2;
ProtoG(\bob, ())

~bob=[2];
ProtoG(\bob)



r=FlowView(windowTitle:"iooooooo");
b= a%=( envir:y, fen:r, bounds:100@100, model:\io,gui:MultiSliderView, initVal:[1,1,1],
	opt:(
		elasticMode:true
	)
); 
b.go

// env
a=MultiSliderView.new(r,30@30)

d= a%=( gui:EnvelopeView,
	hook:{arg v; v.setEnv(ProtoGui.envir[\a].value)})   ;
d.go



/////////////// suite


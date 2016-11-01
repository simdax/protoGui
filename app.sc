ProtoG : APP {

	classvar <all;
	var <type;
	*initClass{
		all = ()
	}
	//var fen;
	*new{ arg ... models;

		var envir=currentEnvironment;
		var fen=(envir[\win].value ?? {FlowView()});

		models.pairsDo
		{|k,v|
			"on put add set".postln;
			envir.postln;
			all.putAddSet(
				({envir.name}?/?(envir.hash.asSymbol)).postln,k.postln
			);
			(this.main(k,fen,envir)%=(v?())).go
		};
		
		^super.new
	}
	// type_{ arg name,f;
	// 	type=f;
	// 	f !? {
	// 		Event.addEventType(name,f)
	// 	}
	// }
	// play{
		
	// }
}
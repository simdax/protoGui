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
		var res;
		models.pairsDo
		{|k,v|
			all.putAddSet(
				({envir.name}?/?(envir.hash.asSymbol)),k
			);
			res=(this.main(k,fen,envir)%=(v?())).go
		};
		
		^res
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
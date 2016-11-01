ProtoG : APP {
	//var fen;
	*new{ arg ... models;
		var fen=FlowView();
		var envir=();
		models.pairsDo
		{|k,v|
			envir.put(k,v);
			this.main(k,fen,envir).go
		} ;
		^fen
	}
	
}
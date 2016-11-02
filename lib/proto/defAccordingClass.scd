(
// sources is to get 'list' from pseq or func from Pfunc
convertSources:ProtoG.sources,
defaultForKey:{arg model; Event.parentEvents.default.at(model.asSymbol)},

// take the initVal from envir
// setting initVal becomes setting a var
initVal:{arg s; s.use{
	var t,real;
	// here we have to deal with 'source' issues
	// for direct Array, 'source' returns UGEN so we just value
	t=(try{~envir.at(~model).source}{~envir.at(~model).value})
	??{ t=~defaultForKey.value(~model)} ;
	real=~convertSources.findKeyForValue(t.class);
	(real!?{t.perform(real)}??{t});
}},

// guess the gui as the
// - classType (Array,Integer,Float, etc...)
gui:{arg s; s.use{
	ProtoG.guisForClasses[~initVal.value(s).class.asSymbol]
	?? {Error("classe inconnue pour cette valeur initiale : "++~initVal).throw} 
}},

// guess the options (in fact, specs especially) according to val and model
opt:{arg s;
	if(s.view.respondsTo(\controlSpec_))
	{(controlSpec:ProtoG.specs.check(s.initVal,s.model))}
	{nil}
}
//(label:{arg s; s.model}
)



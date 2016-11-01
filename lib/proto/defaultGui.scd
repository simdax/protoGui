//all defaults values

// it determines guiclass
// and automatic specs

(
guis:(
	Symbol:StaticText,
	Function:StaticText,
	String:EZText,
	Set:EZPopUpMenu,
	Integer:EZNumber,
	Float:EZKnob,
	Range:EZRanger,
	Point:Slider2D,
	//Array: MultiSliderView,
	Array:Pchange.live,
	Env:EnvelopeView,
	ControlSpec:EZControlSpecEditor,
	Nil:DragBoth
),
// sources is to get 'list' from pseq or func from Pfunc
getSources:ProtoG.sources,
initVal:{arg s; s.use{
	// here we have to deal with 'source' issues
	// for Array it returns UGEN
	var t=	try{~envir.at(~model).source}{~envir.at(~model).value};
	var real=~getSources.findKeyForValue(t.postln.class);
	(real!?{t.perform(real)}??{t});
}},
gui:{arg s; s.use{
	~guis[~initVal.value(s).class.asSymbol]
	?? {Error("classe inconnue pour cette valeur initiale : "++~initVal).throw} 
}},
opt:{arg s;
	if(s.view.respondsTo(\controlSpec_))
	{(controlSpec:ProtoG.specs.check(s.initVal))}
	{nil}
}
//(label:{arg s; s.model}
)



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
	Array:MultiSliderView,
	Pseq:MultiSliderView,
	Env:EnvelopeView,
	ControlSpec:EZControlSpecEditor,
	Nil:DragBoth
),
getSources:Here.sources,
initVal:{arg s; s.use{
	var t=	~envir.at(~model).source;
	var real=~getSources.findKeyForValue(t.class);
	(real!?{t.perform(real)}??{t}).postln;
}},

gui:{arg s; s.use{
	~guis[~initVal.value(s).class.asSymbol]
	?? {"classe inconnue".warn} 
}},
//opt:(label:{arg s; s.model})
)


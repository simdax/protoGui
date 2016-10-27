// list
(
// specs:{arg s, obj;
// 	case
// 	{obj.class==SimpleNumber}{ case
// 		{0>obj and: (obj<1)} {\unipolar}
// 		{obj <10}	{[0,10,\lin,]}
// 		{}	{};
// 	}
// },
guis:(
	Symbol:StaticText,
	String:TextField,
	Set:EZPopUpMenu,
	Integer:NumberBox,
	Float:EZKnob,
	Range:EZRanger,
	Point:Slider2D,
	Array:MultiSliderView,
	Env:EnvelopeView,
	ControlSpec:EZControlSpecEditor,
	Nil:DragSink
),
guiObj:{arg s; s.use{ ~guis[~vals.class.asSymbol]}},
go:{arg s,d;
	d.vals.keys.as(Array).collect{ arg x;
		x ->
		[\vals,\guiObj,\spec].inject(().parent_(s.copy),{ arg a,b;
			a.put(b,try{d[b][x]})
		})
	}.asDict.as(Event)
}
)
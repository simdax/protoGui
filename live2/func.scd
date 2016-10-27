
{arg d;
	d.vals.keys.as(Array).collect{ arg x;
	x ->
	[\vals,\guiObj,\spec].inject(().parent_(c.copy),{ arg a,b;
		a.put(b,try{d[b][x]})
	})
}.asDict.as(Event)
}
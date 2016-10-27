(
var func, dic;
#a,b=
"live2/func.scd,live2/def.scd".split($,)
.collect(_.loadRelative).flatten;

d=(vals:(bob:7,string:"coucou",io:3),
	guiObj:(bob:EZNumber,string:TextField))
)

z=b.go(d)

z[\io].guiObj

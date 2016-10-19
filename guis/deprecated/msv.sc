// a multisliderV with a spec
/*
MSV().front;
MSV(nil, 200@200).front;
a=MSV().front.value_([0,3,4]);
a.spec_([0,4])
a.value
a.value_([9, 3, 4])
*/

MSV : MultiSliderView{

	var <spec;
	*new{ arg lay, b, spec=[0, 10];
		^super.new(lay, b).elasticMode_(true)
		.init(spec);
	}
	init{ arg sp;
		spec=(sp.asSpec);
		this.action_{ arg self;
			self.changed(\value, self.value)
		}
	}
	spec_{
		arg a; 
		var ancienSpec=spec;
		spec=a.asSpec;
		super.value_(spec.map(ancienSpec.unmap(super.value)));
	}
	value_{ arg val;
		this.superPerform(\value_, spec.unmap(val) );
		this.changed(\value, this.value)
	}
	value{ 
		^spec.map(this.superPerform(\value))
	}
	update{ arg qui, que ... quoi;
	}

}
+Environment{
	localPut{arg key,val;
		this.put(key,val)
	}
}
+ Event{
	// override to have more plasticity
	localPut{arg key,val;
		this.put(key,val)
	}
	%={arg dest;
		^(dest.parent_(this))
	}
	%%={arg dest;
		^(dest.proto_(this))
	}
	=%{ arg that;
		^this.parent_(that)
	}
	=%%{ arg that;
		^this.proto_(that)
	}
}

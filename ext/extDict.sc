+ Dictionary{
	kvdo{arg f; ^this.keysValuesDo(f)}
	putAdd{arg k,v;
		^this.put(k, this.at(k).add(v))
	}
	putAddSet{arg k,v;
		^this.put(k, this.at(k).add(v).asSet)
	}
}
+ EnvironmentRedirect{
	kvdo{arg f; ^this.keysValuesDo(f)}
}
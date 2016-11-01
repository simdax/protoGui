SpecExt {
	*initClass{
		Class.initClassTree(Spec);
		(
			mtranspose: [-4,4,\lin,1,0],
			root: [-6,6,\lin,1,0],
		).kvdo{ |k,v| Spec.add(k,v)}
	}
}
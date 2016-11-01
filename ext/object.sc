+ Object{
	valueIfNeeded{ arg ... optionalsArgs;
		if(this.isKindOf(Function), {
			^this.value(*optionalsArgs)
		},{^this});
	}
}
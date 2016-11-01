+ Object{
	valueIfNeeded{ arg ... optionalsArgs;
		if(this.isKindOf(Function), {
			^this.value(*optionalsArgs)
		},{^this});
	}
	?/?{ arg rescue;
		^try{this.value}{rescue.value}
	}
}

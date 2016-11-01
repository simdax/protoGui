{
	(
		check:{arg s,val,model;
			model.asSymbol.asSpec ??
			{
				(s[val.class.asSymbol].(val) ?? {
					s[\default].(val)
				}).asSpec
			}
		},
	).parent_((
		Array:{arg val;
			[val.minItem,val.maxItem]
		},
		default:{arg val;
			[val-(val*2),val+(val*2)]
		},		
	))
	//	.check([8, 3,7])

}
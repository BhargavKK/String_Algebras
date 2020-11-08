computeLPSarray := function(pat)
	local lps, i, len, m;
	m := Length(pat);
	lps := [];
	for i in [1..m] do
		Append(lps, [1]);
	od;
	len := 1;
	i := 2;
	while i <= m do
		if pat[i] = pat[len] then
			len := len + 1;
			lps[i] := len;
			i := i+1;
		else
			if len <> 1 then
				len := lps[len-1];
			else
				lps[i] := 1;
				i := i+1;
			fi;
		fi;
	od;

	for i in [1..Length(lps)] do
		lps[i] := lps[i]-1;
	od;

	return lps;
end;

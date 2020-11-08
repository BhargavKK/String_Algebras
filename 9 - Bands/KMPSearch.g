KMPSearch := function(pat, txt)
	local M,N,lps,i,j;
	M := Length(pat);
	N := Length(txt);

	lps := computeLPSarray(pat);
	for i in [1..Length(lps)] do
		lps[i] := lps[i]+1;
	od;

	i := 1;
	j := 1;
	while i <= N do
		if pat[j] = txt[i] then
			j := j+1;
			i := i+1;
		fi;

		if j=M+1 then
			return i-j+1;
		elif i<=N and pat[j] <> txt[i] then
			if j<>1 then
				j := lps[j - 1];
			else
				i := i+1;
			fi;
		fi;
	od;

	return 0;
end;

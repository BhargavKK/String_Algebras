Incoming_Arrows := function(Q,v)
	local i, a, b;
	a := [];

	for i in [1..NumberOfArrows(Q)] do
		Append(a, [SIntChar(String(TargetOfPath(ArrowsOfQuiver(Q)[i]))[2]) - SIntChar('0')]);
	od;

	b := [];
	for i in [1..Length(a)] do
		if v = a[i] then
			Append(b, [ArrowsOfQuiver(Q)[i]]);
		fi;
	od;
	return b;
end;

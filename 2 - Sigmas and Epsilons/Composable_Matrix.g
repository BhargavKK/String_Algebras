Composable_Matrix := function(Q,rho)
	local mat, x, str, i, j;
	mat := [];

	for i in [1..NumberOfArrows(Q)] do
		str := [];
		for j in [1..NumberOfArrows(Q)] do
			if SourceOfPath(ArrowsOfQuiver(Q)[i]) = TargetOfPath(ArrowsOfQuiver(Q)[j]) and not \in(ArrowsOfQuiver(Q)[j]*ArrowsOfQuiver(Q)[i],rho) then
				Append(str, [1]);
			else
				Append(str, [0]);
			fi;
		od;
		Append(mat, [str]);
	od;

	return mat;
end;

IsComposable := function(Q,rho,arrow1,arrow2)
	local i,Mat,pos1,pos2,j;
	Mat := Composable_Matrix(Q,rho);
	for i in [1..NumberOfArrows(Q)] do
		if arrow1 = ArrowsOfQuiver(Q)[i] then
			break;
		fi;
	od;

	for j in [1..NumberOfArrows(Q)] do
		if arrow2 = ArrowsOfQuiver(Q)[j] then
			break;
		fi;
	od;

	return Mat[i][j];
end;

BandsRepresentatives := function(Q,rho,sigma,eps)
	local temp, i, arr_b, arr_s, arr_final, j, str;
	Read("D:/IITK/Semester 3/Project/Codes/BandsOutput.g");

	temp := [];
	arr_final := [];
	for i in [1..Length(b)] do
		if \in(b[i], temp) = false and SIntChar(b[i][1]) >= 97 and SIntChar(b[i][Length(b[i])])<97 then
			Append(arr_final, [b[i]]);
			Append(temp, CyclicPermutationOfABand(Q,rho,b[i],sigma,eps));
		fi;
	od;
	return arr_final;
end;
	#arr_b := [];
	#for i in [1..NumberOfVertices(Q)] do
	#	for j in [1..level] do
	#		str := Concatenation("(", String(i), ",", String(1), ")");
	#		arr_s := vertex_level_all_bands(Q,rho,str,sigma,eps,j);
	#		Append(arr_b, arr_s);
#
#			str := Concatenation("(", String(i), ",", String(-1), ")");
#			arr_s := vertex_level_all_bands(Q,rho,str,sigma,eps,j);
#			Append(arr_b, arr_s);
#		od;
#	od;
#	arr_final := [];
#	temp := [];
#	for i in [1..Length(arr_b)] do
#		if \in(arr_b[i], temp) = false then
#			Append(arr_final, [arr_b[i]]);
#			Append(temp, CyclicPermutationOfABand(Q,rho,arr_b[i],sigma,eps));
#		fi;
#	od;

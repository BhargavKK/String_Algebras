Bands := function(Q,rho,sigma,eps,level1,level2)
	local temp, i, arr_b, arr_s, arr_final, j, str;
	Read("D:/IITK/Semester 3/Project/Codes/StringsLessThanOutput.g");

	temp := [];
	arr_final := [];
	for i in [1..Length(q)] do
		if IsBandString(Q,rho,q[i],sigma,eps) = "This Is A Band" and Length(q[i]) >= level1 and Length(q[i]) <= level2 then
			Append(arr_final, [q[i]]);
		fi;
	od;
	return arr_final;
end;

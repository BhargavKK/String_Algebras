PrimeBands := function(Q,rho,sigma,eps,min,max)
	local i, arr;
	Read("D:/IITK/Semester 3/Project/Codes/BandsLessThanOutput.g");
	arr := [];
	for i in [1..Length(b)] do
		if IsPrimeBand(Q,rho,b[i],sigma,eps) = true and Length(b[i]) >= min and Length(b[i]) <= max then
			Append(arr, [b[i]]);
		fi;
	od;
	return arr;
end;

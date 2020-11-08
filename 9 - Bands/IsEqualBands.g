IsEqualBands := function(Q,rho,b1,b2,sigma,eps)
	local array1, array2, i, j, flag, temp;

	if Length(b1) <> Length(b2) then
		return "Unequal Lengths";
	fi;

	flag := 0;

	for i in [1..Length(b1)] do
		temp := b1[1];
		for j in [1..Length(b1)-1] do
			b1[j] := b1[j+1];
		od;
		b1[j+1] := temp;
		if b1 = b2 then
			flag := 1;
			break;
		fi;
	od;

	if IsBandString(Q,rho,b1,sigma,eps) <> "This Is A Band" or IsBandString(Q,rho,b2,sigma,eps) <> "This Is A Band" then
		return "Either Of Them Are Not Bands";
	fi;

	if flag = 1 then return true;
	else return false;
	fi;
end;
left_infinity_simplification := function(Q, rho, b, u, sigma, eps)
	local lnb, lnu, x, flag, j, temp, d, k, d1;
	lnb := Length(b);
	lnu := Length(u);

	x := Concatenation(b,u);

	if IsValidString(Q,rho,x,sigma,eps) = "Invalid String" then
		return "Invalid String";
	fi;
	flag := 0;
	i := 0;
	for i in [1..lnu] do
		if x[i+lnb] <> x[i] then
			flag := 1;
			break;
		fi;
	od;

	temp := [];
	temp1 := [];
	
	if flag = 1 then
		for j in [1..lnb] do
			Append(temp, [x[i+j-1]]);
		od;
		
		for j in [i+lnb..Length(x)] do
			Append(temp1, [x[j]]);
		od;
	else
		for j in [1..lnb] do
			Append(temp, [x[i+j]]);
		od;

		d1 := [];
		d := String(SourceOfArrow(Q, x[Length(x)]));
		for k in [2..Length(d)] do
			Append(d1, [d[k]]);
		od;
		Append(temp1, ['(']);
		Append(temp1, d1);
		Append(temp1, [',']);
		Append(temp1, String(-1*SigmaOfString(Q,rho,x,sigma,eps)));
		Append(temp1, [')']);
	fi;
	return [temp, temp1];
end;
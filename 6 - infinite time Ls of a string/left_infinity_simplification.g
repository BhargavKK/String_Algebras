left_infinity_simplification := function(Q, rho, b, u, sigma, eps)
	local lnb, lnu, x, flag, j, temp, d, k, d1, i;
	lnb := Length(b);
	lnu := Length(u);

	x := Concatenation(b,u);

	if IsValidString(Q,rho,x,sigma,eps) = "Invalid String" then
		return "Invalid String";
	fi;
	flag := 0;
	for i in [1..lnu] do
		if x[i+lnb] <> x[i] then
			flag := 1;
			break;
		fi;
	od;

	temp := ['['];

	
	if flag = 1 then
		for j in [1..lnb] do
			Append(temp, [x[i+j-1]]);
		od;
		Append(temp, [']']);
		for j in [i+lnb..Length(x)] do
			Append(temp, [x[j]]);
		od;
	else
		for j in [1..lnb] do
			Append(temp, [x[i+j]]);
		od;
		Append(temp, [']']);
		d1 := [];
		d := String(SourceOfArrow(Q, x[Length(x)]));
		for k in [2..Length(d)] do
			Append(d1, [d[k]]);
		od;
		Append(temp, ['(']);
		Append(temp, d1);
		Append(temp, [',']);
		Append(temp, String(-1*SigmaOfString(Q,rho,x,sigma,eps)));
		Append(temp, [')']);
	fi;
	return temp;
end;